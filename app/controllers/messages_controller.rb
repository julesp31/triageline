class MessagesController < ApplicationController
  before_action :set_appointment

  def new
    @message = @appointment.messages.new
  end

  def create
    @message = @appointment.messages.new(message_params)
    if @message.save
      redirect_to @appointment, notice: 'Message sent.'
    else
      render :new
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
