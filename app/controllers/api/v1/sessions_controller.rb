class Api::V1::SessionsController < Devise::SessionsController
  include Api::Concerns::Authenticable

  before_action :sign_in_params, only: :create

  skip_before_action :verify_authenticity_token, only: %i[create signout]


  # api/v1/sign_in.json
  # {
  #   "user": {
  #       "email": "",
  #       "phone": "8728069376",
  #       "password": "123123",
  #       "remember_me": "0"
  #   }
  # }
  def create
    user_phone = sign_in_params[:phone]
    password = sign_in_params[:password]
    user = User.find_by(phone: user_phone)
    if user.present? && user.valid_password?(password)
      sign_in user, store: false
      user.generate_authentication_token!
      user.save
      api_render(auth_token: user.authentication_token,
                 data: user,
                 response_msg: 'User signed in successfully.')
    else
      api_render(http_code: 422,
                 success: false,
                 response_code: 422,
                 response_msg: 'Invalid phone or password')
    end
  end

  # api/v1/sign_out.json
  # Should pass bearer_token
  def signout
    user = User.find_by(authentication_token: bearer_token)

    if user
      user.generate_authentication_token!
      user.save
      sign_out user
      # render json: { ok: user }, status: :ok
      api_render(response_msg: 'User signed out successfully.')
    else
      api_render(http_code: 401,
                 success: false,
                 response_code: 401,
                 response_msg: 'Invalid authentication token')
    end
  end

  private

  def sign_in_params
    params.require(:user).permit(:phone, :password)
  end
end
