class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,:search]
  before_action :set_item, only: [ :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
    @category = Category.find_by(name: 'レディース')
    @category1_items = Item.where(category_id: @category.id) if @category
    
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
  end

  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    @results = @keyword.empty? ? [] : Item.where('name LIKE ?', "%#{@keyword}%")
  end

  def ladies
    @category = Category.find_by(name: 'レディース')
    @items = Item.where(category_id: @category.id) if @category
  end

  def mens
    @category2 = Category.find_by(name: 'メンズ')
    @items = Item.where(category_id: @category2.id) if @category2
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
