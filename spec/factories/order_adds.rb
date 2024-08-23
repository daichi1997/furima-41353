FactoryBot.define do
  factory :order_add do
    postal_code { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    city                { Faker::Address.city }
    address_line_main   { Faker::Address.street_address }
    address_line_sub    { Faker::Address.secondary_address }
    phone_number        { Faker::Number.leading_zero_number(digits: 11) }
    token               { 'tok_abcdefghijk00000000000000000' }
  end
end
