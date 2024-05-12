class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @item_order=ItemOrder.new
 end

  def create
    
    @item_order=ItemOrder.new(order_params)
  end

  private

  def order_params
    params.require(:item_order).permit(:postcode,:prefecture_id,:city,:block,:building,:phone_number).merge(user_id: current_user.id, item_id:params[:item_id],token:params[:token])
  end
end
