class FavoritesController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!

  def create
    if @item.user_id != current_user.id #投稿者以外に限定
      @favorite = Favorite.create(user_id:current_user.id,item_id:@item.id)
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id:current_user.id,item_id:@item.id)
    @favorite.destroy
  end


  private
  def set_item
    @item = Item.find(params[:item_id])
  end


end
