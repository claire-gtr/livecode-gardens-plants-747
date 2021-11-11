class Plant < ApplicationRecord
  belongs_to :garden
  validates :name, presence: true
  has_many :plant_tags # >>> @plant.plant_tags
  has_many :tags, through: :plant_tags # >>> @plant.tags
end
