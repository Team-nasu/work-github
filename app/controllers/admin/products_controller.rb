class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to '/admin/products/new'
  end

  def show
  end

  def edit
  end


    private
  def product_params
    params.require(:product).permit(:name, :introduction, :image, :price)
  end

end
