class PurchaseController < ApplicationController

  before_action :set_item

  def index
    @item_purchase = ItemPurchase.new
  end


  def create
    @item_purchase = ItemPurchase.new(purchase_params)
    if @item_purchase.valid?
      pay_item
      @item_purchase.save
      redirect_to root_path
    else
      render action: :index 
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def purchase_params
    params.require(:item_purchase).permit(:postial_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(token: params[:token], item_id: params[:item_id], user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item[:price],  
      card: purchase_params[:token],  
      currency: 'jpy'
    )
  end
end
