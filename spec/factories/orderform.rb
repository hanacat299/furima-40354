FactoryBot.define do
  factory :order_form do
    product_id             { 1 }
    user_id                { 1 }
    postal_code            { Faker::Number.leading_zero_number(digits: 3) + '-' + }
    prefecture_id          { 2 }
    city                   { Faker::Address.city }
    street_address         { Faker::Address.street_address }
    phone_number           { Faker::Number.leading_zero_number(digits: 11) }
  end
end