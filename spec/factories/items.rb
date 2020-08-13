FactoryBot.define do
  factory :item do
    name               { Faker::Lorem.word }
    text               { Faker::Lorem.sentence }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id        { 2 }
    status_id          { 2 }
    shipping_charge_id { 2 }
    delivery_area_id   { 2 }
    delivery_date_id   { 2 }
    association :user
  end
end
