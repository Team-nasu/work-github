class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  
  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end
  
  def confirm
    @product = Product.find(params[:product_id])
    @cart_items = current_customer.cart_items.all
    @order = Order.new(order_params)
    if params[:order][:address_option] == "0"
      @order.shipping_post_code = current_customer.post_code
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      ship = Address.find(params[:order][:customer_id])
      @order.shipping_post_code = ship.post_code
      @order.shipping_address = ship.address
      @order.shipping_name = ship.name
    elsif params[:order][:address_option] == "2"
      @order.shipping_post_code = params[:order][:shipping_post_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    else
      render 'new'
    end
  end

  def complite
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:postage, :payment_method, :shipping_name, :shipping_address, :shipping_post_code, :customer_id, :total_payment, :status)
  end
end
