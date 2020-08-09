class Item < ApplicationRecord
  belongs_to :user
  has_one :shipping_address
  has_one :buyer
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_date
end
