class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_add = OrderAdd.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_add = OrderAdd.new(order_params)
    if @order_add.valid?
      @order_add.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_add).permit(:postal_code, :prefecture_id, :city, :address_line_main, :address_line_sub, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id]
    )
  end
end
