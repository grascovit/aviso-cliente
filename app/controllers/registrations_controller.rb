# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :disable_registration, only: %i[new create]

  protected

  def sign_up_params
    super.merge(role: :lawyer)
  end

  private

  def disable_registration
    redirect_to unauthenticated_root_path unless ENV['ENABLE_REGISTRATION'] == 'true'
  end
end
