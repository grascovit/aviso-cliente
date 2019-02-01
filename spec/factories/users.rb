# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    mobile_phone { Faker::PhoneNumber.cell_phone }

    factory :lawyer do
      role { :lawyer }
    end

    factory :client do
      role { :client }
    end
  end
end
