Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show,:edit,:index]
  resources :homes
  get "/home/about" => "homes#about"
  post "/books" => "books#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
