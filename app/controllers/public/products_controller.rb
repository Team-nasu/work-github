class Public::ProductsController < ApplicationController
  def index

    @products = Product.page(params[:page])

  end


  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new
    
  end

  #   private
  # def product_params
  #   params.require(:product).permit(:is_active, :Genre, :price)
  # end

end
