class UsersController < ApplicationController

 

  def show
    @user=User.find(params[:id])
    @items = @user.items
    #@orders = @user.orders
    

    
  end
end
