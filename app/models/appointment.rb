class Appointment < ApplicationRecord

  enum status: { Pending: 'Pending', Accepted: 'Accepted', Cancelled: 'Cancelled', Closed: 'Closed' }
  validates :status, inclusion: { in: statuses.keys }

  attr_accessor :date

  belongs_to :patient, class_name: 'User'
  belongs_to :clinician, class_name: 'User'


  has_many :appointment_symptoms
  has_many :symptoms, through: :appointment_symptoms
  has_many :messages

  has_one :chatroom

  validates :appointment_date, :appointment_type, :status, :severity, presence: true

  private


end
