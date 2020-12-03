class PurchaseController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_purchase = ItemPurchase.new
  end


  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      @item_purchase.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index 
    end
  end

  private

  def purchase_params
    params.require(:item_purchase).permit(:postial_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
