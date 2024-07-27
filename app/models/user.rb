class User < ApplicationRecord
  has_many :appointments_as_clinician, class_name: 'Appointment', foreign_key: 'clinician_id'
  has_many :appointments_as_patient, class_name: 'Appointment', foreign_key: 'patient_id'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
