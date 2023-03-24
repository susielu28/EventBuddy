class Chatroom < ApplicationRecord
  has_many :messages
  has_many :users, through: :messages

  belongs_to :user_1, class_name: 'User'
  belongs_to :user_2, class_name: 'User'
end
