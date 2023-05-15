# == Schema Information
#
# Table name: permissions
#
#  id            :bigint           not null, primary key
#  action_name   :string           not null
#  note          :text
#  resource_name :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_permissions_on_action_name    (action_name)
#  index_permissions_on_resource_name  (resource_name)
#
require "test_helper"

class PermissionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
