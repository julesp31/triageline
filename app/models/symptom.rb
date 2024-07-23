class Symptom < ApplicationRecord
  has_many :appointment_symptoms
  has_many :appointments, through: :appointment_symptoms

  validates :category, :description, presence: true
end
