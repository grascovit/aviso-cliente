# frozen_string_literal: true

class User < ApplicationRecord
  enum role: %i[client lawyer]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  validates :first_name, :mobile_phone, :role, presence: true
end
