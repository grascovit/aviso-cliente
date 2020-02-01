# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:client) }
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:address) }
    it { is_expected.to validate_presence_of(:start_at) }
  end

  describe '#latitude_or_longitude_blank' do
    subject(:validate_appointment) { appointment.valid? }

    context 'when latitude or longitude is blank' do
      let!(:appointment) { build(:appointment, latitude: nil, longitude: nil) }

      it 'adds error to the appointment' do
        validate_appointment

        expect(appointment.errors[:base]).to eq(
          [
            I18n.t('activerecord.errors.models.appointment.attributes.base.latitude_or_longitude_blank')
          ]
        )
      end
    end

    context 'when latitude and longitude are present' do
      let!(:appointment) { create(:appointment, latitude: '-12.3456', longitude: '12.3456') }

      it "doesn't add error to the appointment" do
        validate_appointment

        expect(appointment.errors[:base]).to eq([])
      end
    end
  end
end
