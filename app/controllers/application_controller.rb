class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warn, :alert, :notice, :success

  before_action :authenticate_user!
  include Pundit::Authorization

  before_action :set_locale
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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
