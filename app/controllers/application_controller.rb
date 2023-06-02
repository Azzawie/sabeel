class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  add_flash_types :info, :error, :warn, :alert, :notice, :success
  before_action :set_locale
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  include Pundit::Authorization

  include Authenticable
  before_action :authenticate_user_with_token!, if: -> { request.format.json? }

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def user_not_authorized(_exception)
    # policy_name = exception.policy.class.to_s.underscore
    # "#{policy_name} #{exception}"
    error_msg = "Sorry, you don't have permission to perform this action."
    respond_to do |format|
      format.json { api_render(http_code: 422, success: false, response_code: 422, response_msg: error_msg) }
      format.html { redirect_back fallback_location: root_path, alert: error_msg }
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fname lname phone])
  end
end
