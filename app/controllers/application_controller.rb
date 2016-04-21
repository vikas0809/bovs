class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  
  before_action :configure_permitted_parameters, if: :devise_controller?
 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up){ |u| u.permit(:password_confirmation, :password, :email, :firstName, :lastName, :contactNumber, :streeAddress, :city, :province, :postalCode, :country) }
    devise_parameter_sanitizer.for(:account_update){ |e| e.permit(:password_confirmation, :current_password, :password, :email, :firstName, :lastName, :contactNumber, :streeAddress, :city, :province, :postalCode, :country) }
  end
   
end
