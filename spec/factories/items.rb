FactoryBot.define do
  factory :item do
    item_name            { Faker::Commerce.product_name }
    description          { Faker::Lorem.paragraph }
    category_id          { Faker::Number.between(from: 2, to: 11) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    shipping_date_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 2, to: 9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
