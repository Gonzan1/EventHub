class User < ApplicationRecord
  # Asociaciones
  has_many :events, foreign_key: 'organizer_id', dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :attended_events, through: :registrations, source: :event
  has_many :reviews, dependent: :destroy

  # Validaciones
  validates :email, presence: true, uniqueness: true

  # Enum para el rol
  enum :role, { regular: 0, admin: 1 }
end