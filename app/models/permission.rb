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
class Permission < ApplicationRecord
  ACTIONS = %i[create read update destroy index].freeze
  has_many :user_permissions
  has_many :users, through: :user_permissions
  validates :action_name, :resource_name, presence: true
  validates :action_name, uniqueness: { scope: :resource_name }

  # retrun all the controllers as an array
  def self.resources
    a = []
    Dir.new("#{::Rails.root}/app/controllers").entries.each do |i|
      a << i.gsub('_controller.rb', '').gsub('application', '').gsub('home', '') if i =~ /_controller/
    end
    a.compact_blank!
  end

  def self.all_permissions
    per_list = []
    all.sort_by(&:resource_name).each do |permission|
      per_list << ({ permission.resource_name => permission.action_name })
    end
    per_list
  end
end
