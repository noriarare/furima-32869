class OrdersController < ApplicationController

  before_action :order_item
  before_action :chenge_order
  before_action :authenticate_user!

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:post, :municipality, :house_number, :tel, :building, :from_id).merge(token: params[:token],user_id: current_user.id, item_id: params[:item_id])
  end


  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 環境設定より
      Payjp::Charge.create(
        amount: @item[:price],  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def order_item
    @order_item = Item.find(params[:item_id])
  end

  def chenge_order
    if @order_item[:user_id] == current_user.id or @order_item.order.present?
      return redirect_to root_path
    end
  end

end
