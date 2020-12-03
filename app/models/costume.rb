class Costume < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  validates :name, :description, :price, :size, presence: true
  validates :price, :price, numericality: { only_integer: true }
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos
  has_many :costume_tags
  has_many :tags, through: :costume_tags
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  pg_search_scope :tag_search,
                  associated_against: {
                    tags: [:name]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }

  def unavailable_dates
    bookings.where(status: "accepted").pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
