class Api::V1::UsersController < Api::V1::BaseController


  ######################################################################
  # We will update this later when we want to update the user profile 
  ######################################################################
  # acts_as_token_authentication_handler_for User

  # def update
  #   user = User.find(params[:id])
  #   if user.valid_password?(params[:current_password].to_s)
  #     puts 'password matched'
  #     user.update(user_params)
  #     render json: {
  #       messages: 'Updated Successfully',
  #       is_success: true,
  #       data: { user: }
  #     }, status: 201
  #   else
  #     puts 'pw didnt match'
  #     render json: {
  #       messages: 'Incorrect Password Please Try Again',
  #       is_success: false,
  #       data: { user: }
  #     }, status: 403
  #   end
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:phone, :fname, :lname)
  # end
end
