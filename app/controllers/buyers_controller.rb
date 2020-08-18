class BuyersController < ApplicationController
  before_action :move_to_session
  before_action :move_to_index

  def index
      @item = Item.find(params[:item_id])
  end

  def create
    @buyer = Buyer.new(price: order_params[:price])
    if @buyer.valid?
      pay_item
      @buyer.save
      return redirect_to root_path
    else
      render :show
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
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

end