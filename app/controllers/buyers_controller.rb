class BuyersController < ApplicationController

  def index
    unless user_signed_in?
      redirect_to new_user_session_path
    else
      @item = Item.find(params[:item_id])
    end
  end

end