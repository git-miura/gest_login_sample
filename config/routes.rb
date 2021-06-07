Rails.application.routes.draw do

  root "posts#index"
  resources :posts
  devise_for :users, controllers: {
    registrations: "users/registrations"
  }

  resource :users, only: :show

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
end
