class Message < ApplicationRecord
  #belongs_to :appointment
  belongs_to :chatroom
  belongs_to :user

  validates :text, presence: true
  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to "chatroom_#{chatroom.id}_messages",
                        partial: "messages/message",
                        locals: { message:self },
                        target: 'messages'
  end
end
