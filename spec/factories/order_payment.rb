FactoryBot.define do
  factory :order_payment do
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
    postal_code { '123-4567' }
    shipping_area_id { Faker::Number.between(from: 2, to: 47) }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
  end
end
