class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # protect_from_forgery with: :null_session
  # skip_before_action :verify_authenticity_token

  add_flash_types :info, :error, :warn, :alert, :notice, :success
  before_action :set_locale
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pundit::Authorization

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:error] = t("#{policy_name}.#{exception.query}", scope: 'pundit', default: :default)
    redirect_back(fallback_location: root_path)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fname lname phone])
  end
end
