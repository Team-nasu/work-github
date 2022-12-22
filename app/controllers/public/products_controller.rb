class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to '/public/cart_items'
  end


    private
  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
