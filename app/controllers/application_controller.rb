class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def current_user
    super || guest_user
  end

  def guest_user
    guest =  GuestUser.new
    guest.name = "Guest"
    guest.email = "none@none.com"
    guest.username = "guest1"
    guest
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username])
  end

end
