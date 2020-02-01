# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :client

  validates :address, :start_at, presence: true
  validate :latitude_or_longitude_blank?

  private

  def latitude_or_longitude_blank?
    errors.add(:base, :latitude_or_longitude_blank) if latitude.blank? || longitude.blank?
  end
end
