class PurchaseController < ApplicationController

  def index
  end

  def create
    Purchase.create(purchase_params)
  end

  private
  def purchase_params
    params.require(:purchase).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
