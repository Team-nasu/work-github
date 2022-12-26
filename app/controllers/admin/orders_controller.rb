class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if @order.order_status == "confirmation_of_payment"
      @order.order_products.each do |order_product|
        order_product.update(making_status: "waiting_for_production")
      end
    end

    redirect_to admin_order_path
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end
end
