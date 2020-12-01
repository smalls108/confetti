class Costume < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :size, presence: true
  validates :price, :price, numericality: { only_integer: true }
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many_attached :photos
end
