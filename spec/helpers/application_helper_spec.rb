# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#flash_class' do
    subject { helper.flash_class(type) }

    context 'when flash type is alert' do
      let(:type) { 'alert' }

      it { is_expected.to eq('alert-danger') }
    end

    context 'when flash type is notice' do
      let(:type) { 'notice' }

      it { is_expected.to eq('alert-primary') }
    end
  end

  describe '#active_item' do
    subject { helper.active_item('clients') }

    before do
      allow(helper).to receive(:controller_name).and_return(controller_name)
    end

    context 'when item is active' do
      let(:controller_name) { 'clients' }

      it { is_expected.to eq('active') }
    end

    context 'when item is not active' do
      let(:controller_name) { 'something_else' }

      it { is_expected.to be_nil }
    end
  end
end
