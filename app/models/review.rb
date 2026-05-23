class Review < ApplicationRecord
  belongs_to :user
  belongs_to :event

  validates :rating, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :comment, presence: true
  validate :user_must_have_attended

  private

  def user_must_have_attended
    return unless event && user

    # Regla: El evento debe estar completado
    unless event.completed?
      errors.add(:base, "You can only review completed events.")
    end

    # Regla: El usuario debe tener status "confirmed"
    registration = user.registrations.find_by(event: event)
    unless registration&.confirmed?
      errors.add(:base, "You must have attended this event to leave a review.")
    end
  end
end