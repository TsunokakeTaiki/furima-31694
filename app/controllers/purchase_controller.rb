class PurchaseController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @item_purchase = ItemPurchase.new
  end

  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      @@item_purchase.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private
  def purchase_params
    params.require(:item_purchase).permit(:postial_code, :prefecture_id, :city, :addresses, :building, :phone_number）.merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
