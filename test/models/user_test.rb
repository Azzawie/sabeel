# == Schema Information
#
# Table name: users
#
#  id                        :bigint           not null, primary key
#  authentication_token      :string           not null
#  current_sign_in_at        :datetime
#  email                     :string           default(""), not null
#  encrypted_password        :string           default(""), not null
#  fname                     :string           not null
#  is_verified               :boolean          default(FALSE), not null
#  last_sign_in_at           :datetime
#  lname                     :string           not null
#  phone                     :string
#  remember_created_at       :datetime
#  reset_password_sent_at    :datetime
#  reset_password_token      :string
#  sign_in_count             :integer          default(0), not null
#  verification_code         :string
#  verification_code_sent_at :datetime
#  verified_at               :datetime
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#
# Indexes
#
#  index_users_on_phone                 (phone) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
