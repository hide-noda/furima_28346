class Item < ApplicationRecord
  belongs_to :user
  has_one :shipping_address
  has_one :buyer
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :shipping_charge
    belongs_to_active_hash :delivery_area
    belongs_to_active_hash :delivery_date
    with_options presence: true do
      validates :image, :name, :text, :price, :category, :status, :shipping_charge, :delivery_area, :delivery_date
    end
    with_options numericality: { other_than: 1 } do
      validates :category, :status, :shipping_charge, :delivery_area, :delivery_date
    end


end
