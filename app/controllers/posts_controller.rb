class PostsController < ApplicationController
  #非ログイン時にトップページにリダイレクトさせる indexを除く
  before_action :authenticate_user!, except: :index

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    current_user.posts.create!(post_params)
  end


  private

  def post_params
    params.require(:post).permit(:title, :comment)
  end
end
