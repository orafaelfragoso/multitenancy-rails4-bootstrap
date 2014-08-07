class SubdomainPresent
  def self.matches?(request)
    request.subdomain.present?
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do

  constraints(SubdomainPresent) do
    root to: 'dashboard#index', as: :dashboard_root
    devise_for :users
  end

  constraints(SubdomainBlank) do
    root to: 'home#index'

    # Account creation
    resources :accounts, only: [:new, :create]
  end
  
end
