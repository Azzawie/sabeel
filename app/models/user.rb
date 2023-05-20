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
class User < ApplicationRecord
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable # , :validatable No need for email vaildation so we stoped it.

  has_many :user_permissions,dependent: :destroy
  has_many :permissions, through: :user_permissions

  validates :phone, uniqueness: true

  before_create :generate_authentication_token!

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def has_permissions?
    permissions.any?
  end

  def self.send_sms2
    Twilio::REST::Client.new.messages.create(
      body: 'This is your confirmation code, please don\'t share it with others',
      from: Rails.application.credentials.dig(:twilio, :phone_number),
      to: '+18728069376'
    )
  end

  def can?(action_name, resource_name)
    permissions.find_by(action_name:, resource_name:).present?
  end

  def all_policies
    classes = Permission.resources

    policies = {}

    classes.each do |clazz|
      policy = Pundit.policy(self, clazz.singularize.capitalize.camelcase.constantize)

      next if policy.nil?

      policy.public_methods(false).sort.each do |m|
        result = policy.send(m)
        policies["#{clazz}.#{m}"] = result
      end
    end

    policies
  end

  def all_permissions
    per_list = []
    permissions.sort_by(&:resource_name).each do |permission|
      per_list << ({ permission.resource_name => permission.action_name })
    end
    per_list
  end
 # Generate a unique identification token for user
  def generate_authentication_token!
    loop do
      self.authentication_token = Devise.friendly_token
      break unless self.class.exists?(authentication_token:)
    end
  end
 
end
