Rails.application.routes.draw do
  get 'sessions/new'

  get 'password/reset'
  get 'password/forgot'
  post 'password/reset'
  post 'password/forgot'
  
  resources :users
  get 'users/new'
  get 'users/create'
  
  get 'home/index'
  post 'home/index'
  get 'home/login'
  get 'home/logout'
  post 'home/login'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
