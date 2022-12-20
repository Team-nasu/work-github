class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page])
  end
end
