# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :clients, dependent: :destroy

  validates :first_name, :mobile_phone, presence: true
end
