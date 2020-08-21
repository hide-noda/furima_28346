class BuyersController < ApplicationController
  before_action :move_to_session
  before_action :move_to_index

  def index
  end

  def create
    shipping_address = BuyerAddress.new(address_params)
    if shipping_address.valid?
      pay_item
      shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def move_to_session
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    end
  end

  def order_params
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    @item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def address_params
    params.permit(:postal_code, :delivery_area_id, :city, :city_address, :building_name, :phone_number, :item_id, :buyer_id).merge(user_id: current_user.id)
  end
end
