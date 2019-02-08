# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: user_attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: user_attributes)
  end

  private

  def user_attributes
    %i[first_name last_name mobile_phone]
  end
end
