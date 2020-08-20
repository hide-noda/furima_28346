FactoryBot.define do
  factory :buyer_address do
    postal_code        {"123-4567"}
    delivery_area_id   {2}
    city               {"刈谷市相生町"}
    city_address       {"1番地"}
    building_name      {"ビルディング"}
    phone_number       {"09012345678"}
    user_id            {1}
    item_id            {1}
  end
end
