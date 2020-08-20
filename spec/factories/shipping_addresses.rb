FactoryBot.define do
  factory :shipping_address do
    association        :item
    association        :buyer
  end
end
