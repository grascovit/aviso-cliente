# frozen_string_literal: true

class Client < ApplicationRecord
  belongs_to :user

  validates :first_name, :email, :mobile_phone, presence: true
  validates :email, uniqueness: { scope: :user_id }
end
