class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action:set_current_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  
  
  def set_current_user
    @current_user = current_user
  end
  
  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :username, :password, :password_confirmation, :image ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end
