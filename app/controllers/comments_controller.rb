class CommentsController < ApplicationController

  def create
    @comment = Comment.create(comment_params)
    if @comment.save
      redirect_to "/items/#{@comment.item.id}"
    end
  end

  #def destroy
    #@item = Item.find(params[:item_id])
    #@comment = Comment.find([:id])
    #if @comment.destroy
      #redirect_to item_path(@item)
    #end
  #end


  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
