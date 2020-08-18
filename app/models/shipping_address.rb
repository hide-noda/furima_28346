class ShippingAddress < ApplicationRecord
  belongs_to :item
  belongs_to :buyer
  belongs_to_active_hash :prefecture
end
