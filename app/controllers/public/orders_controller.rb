class Public::OrdersController < ApplicationController
  def new
  end

  def confirm  #注文情報確認画面
    @product = Product.find(params[:product_id])
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    
    if params[:order][:address_option] == "0" #注文画面で住所選択が0のときログインユーザーの住所
      @order.shipping _postal_code = current_customer.postcode
      @order.shipping_address = current_customer.address
      @order.shipping_name = current_customer.last_name + current_customer.first_name
      
    elsif params[:order][:address_option] == "1" #注文画面で住所選択が1のとき配送先テーブルからデータ取得
      ship = Address.find(params[:order][:customer_id]) #該当の会員IDの配送先データ取得
      @order.shipping_postal_code = ship.postcode
      @order.shipping_address = ship.address
      @order.shipping_name = ship.name
    
    elsif params[:order][:address_option] = "2" #注文画面で選択が2のとき新規登録
      @order.shipping_post_code = params[:order][:shipping_post_code]
      @order.shipping_address = params[:order][:shipping_address]
      @order.shipping_name = params[:order][:shipping_name]
    else
      render :new
    end
  end

  def complite
  end

  def index
  end

  def show
  end
end
