class AppointmentsController < ApplicationController
  before_action :set_show_navbar, only: [:show, :new, :index]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :confirmation, :toggle_status]
  before_action :hide_footer, only: [:new]

  def index
    if current_user.clinician
      @appointments = current_user.appointments_as_clinician.order(appointment_date: :desc)
    else
      @appointments = current_user.appointments_as_patient.order(appointment_date: :desc)
    end

    if params[:status].present?
      @appointments = @appointments.where(status: params[:status])
    end

    @appointments = @appointments.order(appointment_date: :desc)
  end

  def show
    @appointment = Appointment.find(params[:id])
    @clinician = User.find(@appointment.clinician_id)
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.patient_id = current_user.id
    @appointment.clinician_id = User.find_by(email: params[:clinician_email]).id
    @appointment.status = 'Pending'
    @appointment.appointment_date = DateTime.parse(params[:appointment][:date])
    @appointment.created_at = Time.now

    if @appointment.save!
        create_chatroom(@appointment.id)
        @clinician = @appointment.clinician
        render :show
    else
        render :new
    end
  end

  def edit
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to @appointment, notice: 'Appointment changed.'
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_url, notice: 'Appointment cancelled.'
  end

  def confirmation
  end

  def toggle_status
    case params[:status]
    when 'Pending'
      @appointment.update(status: 'Pending')
    when 'Accepted'
      @appointment.update(status: 'Accepted')
    when 'Closed'
      @appointment.update(status: 'Closed')
    when 'Cancelled'
      @appointment.update(status: 'Cancelled')
    end

    respond_to do |format|
      format.html { redirect_to appointments_path, notice: 'Appointment status was successfully updated.' }
      format.json { head :no_content }
    end
  end

    private

    def set_show_navbar
      @show_navbar = false
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:patient_id, :clinician_email, :date, :appointment_type, :status, :severity)
    end

    def create_chatroom(id)
      chatroom = Chatroom.new
      chatroom.appointment_id = id
      chatroom.created_at = Time.now
      chatroom.name = "room #{Chatroom.count}"
      chatroom.save!
    end

    def hide_footer
      @hide_footer = true
    end
end
