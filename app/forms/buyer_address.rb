class BuyerAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city, :city_address, :building_name, :phone_number, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, :delivery_area_id, :city, :city_address, :phone_number, :item_id, :user_id
  end
  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :phone_number, format: {with: /\d{9,11}\z/}

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, city_address: city_address, building_name: building_name, phone_number: phone_number, item_id: item_id, buyer_id: buyer.id)
  end
end