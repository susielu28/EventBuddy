class Event < ApplicationRecord
  belongs_to :user
  has_many :event_members, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one_attached :photo
  include PgSearch::Model

  pg_search_scope :global_search,
  against: [ :name, :date, :price, :venue, :genre ],
  using: {
    tsearch: { prefix: true }
  },
  conditions: ->(query) {
    { price: (query[:price_min]..query[:price_max]), date: (query[:date_min]..query[:date_max]) }
  }
end
