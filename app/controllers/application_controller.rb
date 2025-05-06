class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization
  

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dateofbirth, :phone_number, :address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :dateofbirth, :phone_number, :address])
  end
end
