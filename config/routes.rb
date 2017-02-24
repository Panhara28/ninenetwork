Rails.application.routes.draw do
  resources :posts
  resources :pages
  # get "pages"=> "pages#index"
  # get "pages/:id" => "pages#show", as: "page"
  root "posts#index"
end
