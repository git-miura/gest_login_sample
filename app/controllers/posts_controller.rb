class PostsController < ApplicationController
  #非ログイン時にトップページにリダイレクトさせる indexを除く
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.order(id: :asc)
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create!(post_params)
    redirect_to root_path

  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy!
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update!(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :comment, :image)
  end
end
