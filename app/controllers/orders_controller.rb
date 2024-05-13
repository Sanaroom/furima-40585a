class OrdersController < ApplicationController
  before_action :set_item, only: [:index,:create]


  def index    
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @item_order=ItemOrder.new
 end

  def create
    @item_order=ItemOrder.new(order_params)    
    if @item_order.valid?
     pay_item
      @item_order.save
      return redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render 'index', status: :unprocessable_entity
    end    
  end

  private

  def order_params
    params.require(:item_order).permit(:postcode,:prefecture_id,:city,:block,:building,:phone_number).merge(user_id: current_user.id, item_id:params[:item_id],token:params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
