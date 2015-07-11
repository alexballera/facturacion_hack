class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected  

	def authenticate_admin!
		redirect_to_root_path unless user_signed_in? && current_user.is_admin?
	end	

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password) }
   	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :username, :password, :current_password) }
	end
end
