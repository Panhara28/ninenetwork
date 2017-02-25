Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :posts
  resources :pages
  # get "pages"=> "pages#index"
  # get "pages/:id" => "pages#show", as: "page"
  root "posts#index"
end
