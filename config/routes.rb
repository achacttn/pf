Rails.application.routes.draw do
  
  root to: "pages#home"

  get "/search" => "pages#search"

  get "/:category" => "pages#category"

  resources :users
  
end