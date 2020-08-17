class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]


  def index
    @items = Item.all.order(id: "DESC")
    @buyer = Buyer.new
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :text, :price, :category_id, :status_id, :shipping_charge_id, :delivery_area_id, :delivery_date_id).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
