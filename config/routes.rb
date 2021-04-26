Rails.application.routes.draw do
  root to: 'homes#top'

  post "/users/sign_in" => "books#show"

  devise_for :users
  delete "books/:id" => "books#destroy", as: "destroy_book"
  resources :books, only: [:new, :create, :index, :edit, :update, :show]
  resources :sessions, only: [:new]
  resources :users, only: [:show,:edit,:index,:update]
  resources :homes, only: [:top, :about]
  get "/home/about" => "homes#about"
  post "/books" => "books#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
