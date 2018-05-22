Rails.application.routes.draw do
  
  root to: "pages#home"

  get "/login" => "session#new"
  post "/login" => "session#create"
  delete "/login" => "session#destroy"

  resources :users

  get "/profile" => "users#profile"

  get "/search" => "pages#search"

  get "/:category" => "pages#category"

end