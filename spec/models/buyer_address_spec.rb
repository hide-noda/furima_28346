require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  before do
    @buyer = FactoryBot.build(:buyer_address)
    @seller = FactoryBot.build(:user)
  end

  describe '配送先の保存' do
    context '配送先が保存できる場合' do
      it '配送先情報が全てあれば保存できる' do
        expect(@buyer).to be_valid
      end
      it 'building_nameのみ空でも保存できる' do
        @buyer.building_name = ""
        expect(@buyer).to be_valid
      end
    end

    context '配送先が保存できない場合' do
      it 'postal_codeが空だと保存できない' do
        @buyer.postal_code = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @buyer.postal_code = "1234567"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Postal code is invalid")
      end
      it 'delivery_area_idが1だと保存できない' do
        @buyer.delivery_area_id = 1
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Delivery area must be other than 1")
      end
      it 'cityが空だと保存できない' do
        @buyer.city = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'city_addressが空だと保存できない' do
        @buyer.city_address = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("City address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @buyer.phone_number = ""
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンが入っていると保存できない' do
        @buyer.phone_number = "090-1234-5678"
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Phone number is invalid")
      end
      it 'itemが紐づいていないと保存できない' do
        @buyer.item_id = nil
        @buyer.valid?
        expect(@buyer.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

