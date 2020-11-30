class Booking < ApplicationRecord
  belongs_to :costume
  belongs_to :user
  validates :start_date, :end_date, presence: true
  has_one :review
end
