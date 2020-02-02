# frozen_string_literal: true

class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_appointment, only: %i[edit update destroy]

  def index
    @appointments = current_user.appointments.includes(:client)
  end

  def new
    @appointment = current_user.appointments.new
  end

  def edit; end

  def create
    @appointment = current_user.appointments.new(appointment_params)

    if @appointment.save
      redirect_to appointments_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @appointment.update(appointment_params)
      redirect_to appointments_path, notice: t('.success')
    else
      render :edit
    end
  end

  def destroy
    @appointment.destroy

    redirect_to appointments_path, notice: t('.success')
  end

  private

  def fetch_appointment
    @appointment = current_user.appointments.find(params[:id])
  end

  def appointment_params
    params.require(:appointment).permit(
      :client_id,
      :description,
      :start_at,
      :end_at,
      :address,
      :latitude,
      :longitude
    )
  end
end
