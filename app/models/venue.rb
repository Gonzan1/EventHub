class Venue < ApplicationRecord
  # Asociaciones
  has_many :events, dependent: :destroy

  # Validaciones
  validates :name, presence: true
  validates :location, presence: true
end