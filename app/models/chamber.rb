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
class Chamber < ApplicationRecord
    has_many :daily_statements, dependent: :destroy
    def has_statements?
        self.daily_statements.any?
    end
end
