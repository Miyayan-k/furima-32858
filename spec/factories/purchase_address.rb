FactoryBot.define do
  factory :purchase_address do
    post_number   { Faker::Address.postcode }
    prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city          { Gimei.city.kanji }
    street_number { '1-1' }
    building      { 'ジオグランデマンション3301' }
    tel           { Faker::Number.leading_zero_number(digits: 10) }
    token         { 'tok_anejjxueialskd00000000000' }
    association   :user, :item
  end
end
