class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  acts_as_taggable_on :interests #You can also configure multiple tag types per model
  has_many :messages
  has_many :chatrooms
  has_one_attached :photo


  has_many :event_members, dependent: :destroy
  has_many :events, through: :event_members
  INTERESTS = ["conferences", "expos", "community", "performing-arts", "concerts", "festivals", "sports"]
end
