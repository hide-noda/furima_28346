class BuyerAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city, :city_address, :building_name, :phone_number, :item_id, :user_id

  POSTAL_CODE_REGEX = /\A[0-9]{3}-[0-9]{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\d{9,11}\z/.freeze
  with_options presence: true do
    validates :postal_code, format: {with: POSTAL_CODE_REGEX}
    validates :phone_number, format: {with: PHONE_NUMBER_REGEX}
    validates :delivery_area_id, numericality: { other_than: 1 }
    validates :city, :city_address, :item_id, :user_id
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, city_address: city_address, building_name: building_name, phone_number: phone_number, item_id: item_id, buyer_id: buyer.id)
  end
end