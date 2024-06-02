FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    sei                   { "山田" }
    mei                   { "太郎" }
    kana_sei              { "ヤマダ" }
    kana_mei              { "タロウ" }
    birthday              { "2024-06-03" }
  end
end