class MessagesController < ApplicationController
  before_action :set_appointment

  def new
    @message = @appointment.messages.new
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    @message.chatroom_id = params[:chatroom_id]

    if @message.save
      redirect_to appointment_chatroom_path(@message.chatroom.appointment, @message.chatroom)
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:appointment_id])
    end

    def message_params
      params.require(:message).permit(:text)
    end
end
