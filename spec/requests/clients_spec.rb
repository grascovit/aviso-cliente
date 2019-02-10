# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clients', type: :request do
  let(:user) { create(:user) }
  let!(:client) { create(:client, user: user) }
  let(:valid_attributes) do
    {
      client: {
        first_name: 'Client',
        last_name: '01',
        email: 'client@email.com',
        mobile_phone: '99999999'
      }
    }
  end
  let(:invalid_attributes) do
    {
      client: {
        first_name: '',
        last_name: '',
        email: '',
        mobile_phone: ''
      }
    }
  end

  before do
    user.confirm
    sign_in(user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      get clients_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get new_client_path

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get edit_client_path(client)

      expect(response).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new client' do
        expect do
          post clients_path, params: valid_attributes
        end.to change(Client, :count).by(1)
      end

      it 'redirects to the clients list' do
        post clients_path, params: valid_attributes

        expect(response).to redirect_to(clients_path)
      end
    end

    context 'with invalid params' do
      it 'does not create a new client' do
        expect do
          post clients_path, params: invalid_attributes
        end.not_to change(Client, :count)
      end

      it 'renders the client form again' do
        post clients_path, params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'PATCH/PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        {
          client: {
            mobile_phone: '12121212'
          }
        }
      end

      it 'updates the requested client' do
        expect do
          put client_path(client), params: new_attributes
          client.reload
        end.to change(client, :mobile_phone).from(client.mobile_phone).to('12121212')
      end

      it 'redirects to the clients list' do
        put client_path(client), params: new_attributes
        client.reload

        expect(response).to redirect_to(clients_path)
      end
    end

    context 'with invalid params' do
      it 'does not update the client' do
        old_mobile_phone = client.mobile_phone
        put client_path(client), params: invalid_attributes
        client.reload

        expect(client.mobile_phone).to eq(old_mobile_phone)
      end

      it 'renders the client form again' do
        put client_path(client), params: invalid_attributes

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested client' do
      expect do
        delete client_path(client)
      end.to change(Client, :count).by(-1)
    end

    it 'redirects to the clients list' do
      delete client_path(client)

      expect(response).to redirect_to(clients_path)
    end
  end
end
