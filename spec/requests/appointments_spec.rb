# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Appointments', type: :request do
  let(:user) { create(:user) }
  let(:client) { create(:client) }
  let!(:appointment) { create(:appointment, user: user) }
  let(:valid_attributes) do
    {
      appointment: {
        client_id: client.id,
        description: 'description',
        start_at: 2.days.from_now,
        address: '5th Avenue, 123',
        latitude: '12.34567',
        longitude: '98.76543'
      }
    }
  end
  let(:invalid_attributes) do
    {
      appointment: {
        client_id: nil,
        start_at: '',
        address: '',
        latitude: '',
        longitude: ''
      }
    }
  end

  before do
    user.confirm
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get appointments_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_appointment_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get edit_appointment_path(appointment)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new appointment' do
        expect do
          post appointments_path, params: valid_attributes
        end.to change(Appointment, :count).by(1)
      end

      it 'redirects to the appointments list' do
        post appointments_path, params: valid_attributes

        expect(response).to redirect_to(appointments_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new appointment' do
        expect do
          post appointments_path, params: invalid_attributes
        end.not_to change(Appointment, :count)
      end

      it 'renders the appointment form again' do
        post appointments_path, params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          appointment: {
            description: 'new description'
          }
        }
      end

      it 'updates the requested appointment' do
        expect do
          put appointment_path(appointment), params: new_attributes
          appointment.reload
        end.to change(appointment, :description).from(appointment.description).to('new description')
      end

      it 'redirects to the appointments list' do
        put appointment_path(appointment), params: new_attributes
        appointment.reload

        expect(response).to redirect_to(appointments_path)
      end
    end

    context 'with invalid params' do
      it 'does not update the appointment' do
        old_description = appointment.description
        put appointment_path(appointment), params: invalid_attributes
        appointment.reload

        expect(appointment.description).to eq(old_description)
      end

      it 'renders the appointment form again' do
        put appointment_path(appointment), params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested appointment' do
      expect do
        delete appointment_path(appointment)
      end.to change(Appointment, :count).by(-1)
    end

    it 'redirects to the appointments list' do
      delete appointment_path(appointment)

      expect(response).to redirect_to(appointments_path)
    end
  end
end
