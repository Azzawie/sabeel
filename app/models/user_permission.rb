# == Schema Information
#
# Table name: user_permissions
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  permission_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_user_permissions_on_permission_id  (permission_id)
#  index_user_permissions_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (permission_id => permissions.id)
#  fk_rails_...  (user_id => users.id)
#
class UserPermission < ApplicationRecord
  belongs_to :user
  belongs_to :permission
  validates_presence_of :user, :permission
  validates :user_id, uniqueness: { scope: :permission_id }
end
