class User < ApplicationRecord
  has_many :appointments_as_patient, foreign_key: 'patient_id'
  has_many :appointments_as_clinician, foreign_key: 'clinician_id'

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
