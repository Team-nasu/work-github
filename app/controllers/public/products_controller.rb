class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
  end

  def create
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save!
    redirect_to cart_items_path(current_customer.id)
  end


    private
  def cart_item_params
    params.require(:cart_item).permit(:quantity, :product_id)
  end

end
