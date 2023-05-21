class Api::V1::RegistrationsController < Devise::RegistrationsController
  include Api::Concerns::Authenticable
  before_action :authenticate_user_with_token!, except: [:create]
  skip_before_action :verify_authenticity_token, only: %i[create signout]
  before_action :configure_sign_up_params, only: [:create]

  # /api/v1/sign_up.json
  # {
  #   "user": {
  #       "fname": "1112223334",
  #       "lname": "1112223334",
  #       "email": "ddd@2.com",
  #       "phone": "0980972280722229",
  #       "password": "123123",
  #       "password_confirmation": "123123",
  #       "remember_me": "0"
  #   }
  # }
  def respond_with(resource, _opts = {})
    if resource.errors.any?
      # errors_messages = []
      # resource.errors.each do |attr, messages|
      #   errors_messages << { field_name: attr, details: messages }
      # end
      # render json: { status: false, errors: errors_messages }, status: :unprocessable_entity
      api_render(http_code: 422,
                 success: false,
                 response_code: 422,
                 response_msg: resource.errors)
    else
      api_render(auth_token: resource.authentication_token,
                 data: resource,
                 response_msg: 'User Signed up successfully.')

    end
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[fname lname phone])
  end
end
