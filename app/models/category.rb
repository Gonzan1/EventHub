class Category < ApplicationRecord
  # Asociaciones
  has_many :events, dependent: :destroy

  # Validaciones
  validates :name, presence: true, uniqueness: true
end