class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
    @products = Product.all
    @cart_item = @products.all
    #合計金額の初期値は0円
    @total = 0
  end

  def create

    @cart_item = CartItem.find_by(params[:id])
    if @cart_item
      #カートにproductが存在したらquantityに新しいCart_itemのquantityを足す
      @cart_item.quantity += CartItem.new(cart_item_params).quantity
    else
      #カートにproductが無ければ新しく作成する
      @cart_item = CartItem.new(cart_item_params)
    end
    #ログインcustomerのみ更新できるようにするため分岐の外に記述する
    @cart_item.customer_id = current_customer.id
    @cart_item.save!
    redirect_to cart_items_path
  end

  def update
    @cart_item = current_customer
    @product = Product.all
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy!
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end


  private

    def cart_item_params
        params.require(:cart_item).permit(:product_id, :quantity)
    end
end
