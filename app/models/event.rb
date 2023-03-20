class Event < ApplicationRecord
  belongs_to :user
  has_many :event_members, dependent: :destroy
  has_many :comments, dependent: :destroy
end
