class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:index, :create]
  before_action :order_url, only: [:index, :create]
  def index
    @order_payment = OrderPayment.new
  end

  def create
    @order_payment = OrderPayment.new(order_params)
    if @order_payment.valid?
      pay_item
      @order_payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_payment).permit(:postal_code, :shipping_area_id, :city, :house_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_url
    redirect_to root_path if @item.user_id == current_user.id || !@item.order.nil?

    def pay_item
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end
  end
end
