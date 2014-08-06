class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_tenant
    Apartment::Tenant.current_tenant
  end
  helper_method :current_tenant

end
