# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Client, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:first_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:mobile_phone) }
    it { is_expected.to validate_uniqueness_of(:email).scoped_to(:user_id) }
  end
end
