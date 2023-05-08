# == Schema Information
#
# Table name: daily_statements
#
#  id               :bigint           not null, primary key
#  age_days         :integer
#  age_weeks        :integer
#  consumed_food    :float
#  consumed_water   :float
#  daily_production :float
#  deceased         :integer
#  highest_temp     :float
#  humidity_ratio   :float
#  lowest_temp      :float
#  production_ratio :float
#  remaining        :integer
#  total_count      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  chamber_id       :bigint           not null
#
# Indexes
#
#  index_daily_statements_on_chamber_id  (chamber_id)
#
# Foreign Keys
#
#  fk_rails_...  (chamber_id => chambers.id)
#
require "test_helper"

class DailyStatementTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
