class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end

  def create
    @item=Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private
  def item_params
    params.require(:item).permit(:user, :name, :category_id, :item_statue_id, :shipping_cost_id, :prefecture_id, :description, :shipping_date_id, :price) # フォームから送られてくるparamsのうち、DBに保存したい値のキーのみをここに記入
  end
end

