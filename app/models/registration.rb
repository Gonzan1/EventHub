class Registration < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum :status, { confirmed: 0, waitlist: 1 }

  # Regla: No registrarse dos veces
  validates :user_id, uniqueness: { scope: :event_id, message: "is already registered for this event" }
  
  # Regla: Solo registrarse en eventos publicados
  validate :event_must_be_published, on: :create

  # Automatización de la lista de espera
  before_create :assign_status
  after_destroy :promote_waitlisted

  private

  def event_must_be_published
    if event.present? && !event.published?
      errors.add(:base, "You can only register for published events.")
    end
  end

  def assign_status
    # Regla: Confirmed si hay espacio, Waitlist si está lleno
    if event.registrations.confirmed.count < event.capacity
      self.status = :confirmed
    else
      self.status = :waitlist
    end
  end

  def promote_waitlisted
    # Regla: Si un confirmado cancela, el primero en espera sube a confirmado
    if confirmed? 
      next_in_line = event.registrations.waitlist.order(:created_at).first
      next_in_line.update(status: :confirmed) if next_in_line
    end
  end
end