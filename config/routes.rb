Rails.application.routes.draw do
  
  root to: "pages#home"

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"

  resources :users

  resources :articles

  get "/article/new/*url" => "articles#new_with_comment", as: :article_comment
  post "/article/new" => "articles#create_with_comment", as: :comments
  post "/article/show" => "comments#create", as: :comment_creation

  get "/profile" => "users#profile"

  get "/search" => "pages#search"

  get "/about" => "pages#about"

  get "/:category" => "pages#category"

end