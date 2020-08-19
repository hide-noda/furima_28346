class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|
      t.string :postal_code,      default: "", null: false
      t.integer :delivery_area_id,             null: false, foreign_key: true
      t.string :city,             default: "", null: false
      t.string :city_address,     default: "", null: false
      t.string :building_name,    default: ""
      t.string :phone_number,                  null: false
      t.references :item,                      null: false, foreign_key: true
      t.references :buyer,                     null: false, foreign_key: true
      t.timestamps
    end
  end
end
