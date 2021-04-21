Rails.application.routes.draw do
  get 'post_images/new'
  get 'post_images/create'
  get 'post_images/index'
  get 'post_images/show'
  get 'post_images/destroy'
  devise_for :users
  root to: 'homes#top'
  resources :books, only: [:new, :create, :index, :show, :destroy]
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  resources :users, only: [:show,:edit]
  resources :homes
  get "/home/about" => "homes#about"
  post "/books" => "books#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
