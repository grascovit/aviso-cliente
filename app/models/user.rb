# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :trackable, :confirmable

  has_many :clients, dependent: :destroy
  has_many :appointments, dependent: :destroy

  validates :first_name, :mobile_phone, presence: true

  def full_name
    "#{first_name} #{last_name}".strip
  end
end
