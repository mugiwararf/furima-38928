FactoryBot.define do
  factory :order_payment do
    
    postal_code { '123-4567' }
    shipping_area_id { Faker::Number.between(from: 2, to: 47) }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    telephone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
