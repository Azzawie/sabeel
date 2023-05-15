# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_permissions
  has_many :permissions, through: :user_permissions

  validates :phone, uniqueness: true

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def self.send_sms2
    require 'rubygems'
    require 'twilio-ruby'
    @client = Twilio::REST::Client.new

    message = @client.messages.create(
      body: 'wwww',
      from: '+18559293727',
      to: '+18728069376'
    )

    puts message.sid

    def send_sms1
      require 'telegram/bot'

      # Replace the value below with your Telegram Bot API token
      bot_token = '1269757384:AAHDcDazwKy26ZDO_eSpBrsukKcVZ9Mq_bs'

      # Replace the value below with the phone number you want to send the message to
      phone_number = '8728069376'

      # Replace the value below with the message you want to send
      message = 'Hello from your Telegram bot!'

      Telegram::Bot::Client.run(bot_token) do |bot|
        chat_id = bot.api.get_chat_id(chat_id: phone_number).result
        # bot.api.send_message(chat_id: phone_number, text: message)
        bot.api.send_message(chat_id:, text: message)
      end
    end
  end

  def can?(action_name, resource_name)
    permissions.find_by(action_name: action_name, resource_name: resource_name).present?
  end
end
