FactoryBot.define do
  factory :product do
    product_name         { Faker::Name.initials(number: 2) }
    explanation          { Faker::Lorem.sentence }
    genre_id             { "2" }
    condition_id         { "2" }
    shipping_cost_id     { "2" }
    prefecture_id        { "2" }
    shipping_day_id      { "2" }
    price                { "10000" }

    association :user


    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end

  end
end