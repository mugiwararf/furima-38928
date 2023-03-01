FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email     { Faker::Internet.free_email }
    password  { 'g8' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name { '田中' }
    last_name  { '優樹' }
    first_kana { 'タナカ' }
    last_kana  { 'ユウキ' }
    birthday   { Faker::Date.birthday }
  end
end
