class AppointmentsController < ApplicationController
  before_action :set_show_navbar, only: [:show, :new, :index]
  before_action :set_appointment, only: [:show, :edit, :update, :destroy, :confirmation]
  before_action :hide_footer, only: [:new]

  def index
    if current_user.clinician
      @appointments = current_user.appointments_as_clinician
    else
      @appointments = current_user.appointments_as_patient
    end
  end

  def show
    @appointment = Appointment.find(params[:id])
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    if @appointment.save
      redirect_to @appointment, notice: 'Appointment booked.'
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

    private

    def set_show_navbar
      @show_navbar = false
    end

    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    def appointment_params
      params.require(:appointment).permit(:patient_id, :clinician_id, :appointment_date, :appointment_type, :status, :severity)
    end

    def hide_footer
      @hide_footer = true
    end
end
