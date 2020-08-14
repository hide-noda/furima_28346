FactoryBot.define do
  factory :item do
    name               { "商品" }
    text               { "商品の説明です。商品の説明です。商品の説明です。商品の説明です。商品の説明です。" }
    price              { 500 }
    category_id        { 2 }
    status_id          { 2 }
    shipping_charge_id { 2 }
    delivery_area_id   { 2 }
    delivery_date_id   { 2 }
    association :user
  end
end
