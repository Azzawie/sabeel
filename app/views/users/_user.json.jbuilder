json.user do
  json.id user.id
  json.authentication_token user.authentication_token
  json.current_sign_in_at user.current_sign_in_at
  json.email user.email
  json.last_sign_in_at user.last_sign_in_at
  json.sign_in_count user.sign_in_count
  json.phone user.phone
  json.remember_created_at user.remember_created_at
  json.encrypted_password user.encrypted_password
  json.reset_password_sent_at user.reset_password_sent_at
  json.reset_password_token user.reset_password_token
  json.verification_code user.verification_code
  json.verification_code_sent_at user.verification_code_sent_at
  json.verified_at user.verified_at
  json.is_verified user.is_verified
  json.created_at user.created_at
  json.updated_at user.updated_at

  json.has_permissions? user.has_permissions?

  if user.has_permissions?
    json.permissions user.permissions do |permission|
      json.action_name permission.action_name
      json.resource_name permission.resource_name
    end

    json.all_permissions do
      json.array! user.all_permissions
    end
  end
end



