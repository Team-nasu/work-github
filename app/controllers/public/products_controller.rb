class Public::ProductsController < ApplicationController
  def index
  end

  def show
    @product = Product.find(params[:id])
    @cart_item =CartItem
    
  end
end
