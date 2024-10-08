class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :sold_out, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :edit, :destroy]
  before_action :check_item, only: [:index, :create]

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_add = OrderAdd.new
  end

  def create
    @order_add = OrderAdd.new(order_params)
    if @order_add.valid?
      pay_item
      @order_add.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_add).permit(:postal_code, :prefecture_id, :city, :address_line_main, :address_line_sub, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def sold_out
    return unless @item.order.present?

    redirect_to root_path
  end

  def check_item
    @item = Item.find(params[:item_id])
    return unless @item.sold_out? || current_user.id == @item.user_id

    redirect_to root_path
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
