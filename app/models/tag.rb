class Tag < ApplicationRecord
  has_many :costume_tags, dependent: :destroy
  has_many :costumes, through: :costume_tags
end
