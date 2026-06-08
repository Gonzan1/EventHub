class User < ApplicationRecord
  # Configuración de Devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Asociaciones (Asumiendo nombres estándar, ajústalos si cambian en tus migraciones)
  has_many :events, dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :reviews, dependent: :destroy

  # Definición de Roles según el enunciado
  enum :role, { regular: 0, admin: 1 }

  # Asignar rol regular por defecto a los nuevos usuarios
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :regular
  end
end