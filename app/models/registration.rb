class Registration < ApplicationRecord
  # Asociaciones
  belongs_to :user
  belongs_to :event

  # Enum para el estado
  enum :status, { confirmed: 0, waitlist: 1 }

  # Validaciones
  # Evita que un usuario se registre dos veces al mismo evento
  validates :user_id, uniqueness: { scope: :event_id, message: "is already registered for this event" }
end