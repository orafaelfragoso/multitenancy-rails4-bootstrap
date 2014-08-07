class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

Rails.application.routes.draw do

  constraints(SubdomainPresent) do
    devise_for :users
  end

  root to: 'home#index'

  # Account creation
  resources :accounts, only: [:new, :create]
  
end
