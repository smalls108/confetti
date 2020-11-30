class Costume < ApplicationRecord
  belongs_to :user
  validates :name, :description, :price, :size, presence: true
  validates :price, :price, numericality: { only_integer: true }
end
