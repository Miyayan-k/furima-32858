FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    # Faker::Internet.passwordは時に英数混合ではないため、下記使用
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    first_name            { Gimei.last.kanji }
    last_name             { Gimei.first.kanji }
    first_kana            { Gimei.last.katakana }
    last_kana             { Gimei.first.katakana }
    birthday              { '1994-8-30' }
  end
end
