class Admin::OrderProductsController < ApplicationController

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    if @order_product.making_status == "in_production"
      @order_product.order.update(order_status: "in_production")
    end
@order = @order_product.order
    if @order.order_products.count() == @order.order_products.where(making_status:"completion_of_production").count()
      @order_product.order.update(order_status: "preparing_to_ship")
    end
    redirect_to admin_order_path(@order_product.order.id)
  end

      private
  def order_product_params
    params.require(:order_product).permit(:making_status)
  end

end
