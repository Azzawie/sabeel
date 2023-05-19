class ApplicationController < ActionController::Base
  

  add_flash_types :info, :error, :warn, :alert, :notice, :success
  protect_from_forgery with: :null_session
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  skip_before_action :verify_authenticity_token
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pundit::Authorization

  respond_to :html, :json

  protected

  ##
  # This function configures the permitted parameters for signing up with Devise authentication in Ruby.
  def configure_permitted_parameters
    attributes = %i[fname lname email remember_me]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t("#{policy_name}.#{exception.query}", scope: 'pundit', default: :default)
    redirect_back(fallback_location: root_path)
  end
end
