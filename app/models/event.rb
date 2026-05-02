class Event < ApplicationRecord
  # Asociaciones
  belongs_to :organizer, class_name: 'User'
  belongs_to :category
  belongs_to :venue
  has_many :registrations, dependent: :destroy
  has_many :attendees, through: :registrations, source: :user
  has_many :reviews, dependent: :destroy

  # Validaciones
  validates :title, presence: true
  validates :description, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :capacity, presence: true, numericality: { greater_than: 0 }
  validate :end_date_after_start_date # Validación custom para asegurar que la fecha de fin sea posterior a la fecha de inicio

  # Enum para el estado
  enum :status, { draft: 0, published: 1, ongoing: 2, completed: 3 }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end