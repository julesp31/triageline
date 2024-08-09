class Chatroom < ApplicationRecord
  #belongs_to :patient, class_name: 'User'
  #belongs_to :clinician, class_name: 'User'
  has_many :messages
  belongs_to :appointment
end
