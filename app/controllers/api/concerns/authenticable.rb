module Api::Concerns::Authenticable
  extend ActiveSupport::Concern

  def current_user
    if authenticate_token
      @current_user ||= User.find_by(authentication_token: bearer_token)
    else
      super
    end
  end

  def authenticate_user_with_token!
    if user_signed_in?
      render json: { errors: 'OK' }, status: :ok
    else
      render json: { errors: 'Not authenticated' }, status: :unauthorized
    end
  end

  def user_signed_in?
    current_user.present?
  end

  def authenticate_token
    request.headers['Authorization'].present?
  end

  def bearer_token
    pattern = /^Bearer /
    header  = request.headers['Authorization']
    header.gsub(pattern, '') if header && header.match(pattern)
  end

  def api_render(auth_token: nil, success: true, response_code: 200, response_msg: '', data: {}, http_code: 200)
    hash = { success:,
             response_code:,
             response_msg:,
             auth_token:,
             data: }
    render json: hash, status: http_code
  end
end
