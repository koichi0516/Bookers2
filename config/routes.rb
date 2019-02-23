Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get '/' => 'books#top', as: 'top'
  get '/users' => 'users#index'
  get '/books/about' => 'books#about'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:show, :edit, :update]
end
