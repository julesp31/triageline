class Appointment < ApplicationRecord
  belongs_to :patient, class_name: 'User'
  belongs_to :clinician, class_name: 'User'


  has_many :appointment_symptoms
  has_many :symptoms, through: :appointment_symptoms
  has_many :messages

  has_one :chatroom

  validates :appointment_date, :appointment_type, :status, :severity, presence: true

  after_create :create_chatroom

  private

  def create_chatroom
    chatroom = Chatroom.new
    chatroom.appointment.id = self
    chatroom.save
  end
end
