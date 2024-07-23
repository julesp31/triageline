class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :clinician

  has_many :appointment_symptoms
  has_many :symptoms, through: :appointment_symptoms
  has_many :messages

  validates :appointment_date, :appointment_type, :status, :severity, presence: true
end
