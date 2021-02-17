FactoryBot.define do
  factory :item do
    title             { Faker::Movie.title }
    description       { Faker::Lorem.sentence }
    category_id       { Faker::Number.between(from: 1, to: 10) }
    state_id          { Faker::Number.between(from: 1, to: 6) }
    shipping_id       { Faker::Number.between(from: 1, to: 2) }
    consignor_area_id { Faker::Number.between(from: 1, to: 47) }
    days_id           { Faker::Number.between(from: 1, to: 3) }
    price             { Faker::Number.between(from: 300, to: 9999999) }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
