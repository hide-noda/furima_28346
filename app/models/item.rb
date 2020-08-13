class Item < ApplicationRecord
  belongs_to :user
  has_one :shipping_address
  has_one :buyer
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :category
    belongs_to_active_hash :status
    belongs_to_active_hash :shipping_charge
    belongs_to_active_hash :delivery_area
    belongs_to_active_hash :delivery_date
    with_options presence: true do
      validates :image, :name, :text, :price, :category, :status, :shipping_charge, :delivery_area, :delivery_date, :user
    end

    with_options numericality: { other_than: 1 } do
      validates :category_id, :status_id, :shipping_charge_id, :delivery_area_id, :delivery_date_id
    end
    validates :price, numericality: {greater_than_or_equal_to: 300}
    validates :price, numericality: {less_than_or_equal_to: 9999999}
end
