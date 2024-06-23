class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,:search]
  before_action :set_item, only: [  :edit, :update, :destroy, :favorite, :unfavorite]

  def index
    @items = Item.order('created_at DESC')
    @category = Category.find_by(name: 'レディース')
    @category1_items = Item.where(category_id: @category.id) if @category
    @items = Item.includes(:favorites).all
    if user_signed_in?
      @favorited_items = current_user.favorites.pluck(:item_id)
    else
      @favorited_items = []
    end
      
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @previous_item = @item.previous_item
    @next_item = @item.next_item
    if user_signed_in? #ログイン済み
      favorites = Favorite.where(user_id: current_user.id).pluck(:item_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
      @favorited = current_user.favorites.exists?(item_id: @item.id)
    end
  end

  def favorite
    if user_signed_in? #ログイン済み
      if @item.user_id != current_user.id #投稿者以外に限定
        current_user.favorites.create(item:@item)
        redirect_to @item
      end
    end
  end

  def unfavorite
    if user_signed_in? #ログイン済み
      favorite = current_user.favorites.find_by(item:@item)
      favorite.destroy if favorite
      redirect_to @item      
    end
  end




  def edit  
    if @item.user_id != current_user.id || @item.order!=nil
      redirect_to root_path
    else
      render 'edit',status: :unprocessable_entity
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    if user_signed_in? && @item.user == current_user
      @item.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end

    #@favorite = Favorite.find_by(user_id:current_user.id,item_id:@item.id)
    #@favorite.destroy
  end




  def search
     # params[:q]がnilではない且つ、params[:q][:name]がnilではないとき（商品名の欄が入力されているとき）
    # if params[:q] && params[:q][:name]と同じような意味合い
    if params[:q]&.dig(:name)
      # squishメソッドで余分なスペースを削除する
      squished_keywords = params[:q][:name].squish
      ## 半角スペースを区切り文字として配列を生成し、paramsに入れる
      params[:q][:name_cont_any] = squished_keywords.split(" ")
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
  end





  def ladies
    @category = Category.find_by(name: 'レディース')
    @items = Item.where(category_id: @category.id) if @category
  end

  def mens
    @category2 = Category.find_by(name: 'メンズ')
    @items = Item.where(category_id: @category2.id) if @category2
  end

  def baby
    @category3 = Category.find_by(name: 'ベビー・キッズ')
    @items = Item.where(category_id: @category3.id) if @category3
  end
  
 

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :item_statue_id, :shipping_cost_id, :prefecture_id, :description,
                                 :shipping_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
