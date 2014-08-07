Rails.application.routes.draw do

  devise_for :users
  root to: 'home#index'

  # Account creation
  resources :accounts, only: [:new, :create]
  
end
