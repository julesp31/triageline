class Message < ApplicationRecord
  belongs_to :appointment

  validates :text, presence: true
end
