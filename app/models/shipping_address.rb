class ShippingAddress < ApplicationRecord
  belongs_to :item
  belongs_to :buyer
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :delivery_area
end
