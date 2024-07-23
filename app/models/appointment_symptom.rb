class AppointmentSymptom < ApplicationRecord
  belongs_to :appointment
  belongs_to :symptom
end
