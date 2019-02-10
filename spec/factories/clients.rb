# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    mobile_phone { Faker::PhoneNumber.cell_phone }
    user
  end
end
