class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :family_name, :first_name])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:nickname, :email, :family_name, :first_name])
  end
end
