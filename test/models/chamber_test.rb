# == Schema Information
#
# Table name: chambers
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  notes       :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class ChamberTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
