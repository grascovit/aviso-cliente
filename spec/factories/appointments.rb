# frozen_string_literal: true

FactoryBot.define do
  factory :appointment do
    description { Faker::Lorem.paragraph }
    start_at { Faker::Time.forward(days: 2) }
    end_at { Faker::Time.forward(days: 2) }
    address { Faker::Address.full_address }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    user
    client
  end
end
