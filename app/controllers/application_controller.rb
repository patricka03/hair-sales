class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  # include Pundit::Authorization

  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :dateofbirth, :phone_number, :address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :dateofbirth, :phone_number, :address])
  end

  # private

  # def skip_pundit?
  #   devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  # end

  def add_to_cart
    session[:cart] ||= []
    session[:cart] << params[:hair_id]
    redirect_to hairs_path, notice: "Added to cart!"
  end

end
