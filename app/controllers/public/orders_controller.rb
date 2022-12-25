class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses.all
  end

  def confirm  #注文情報確認画面
    @order = Order.new(order_params)
    @cart_items = current_customer.cart_items.all
    @order.postage = 800
    

    if params[:order][:address_option] == "0" #注文画面で住所選択が0のときログインユーザーの住所
      @order.shipping_postal_code = current_customer.postcode
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

  def create #注文確認でデータをorderに送る
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.save

    current_customer.cart_items.each do |cart_item| #カート内商品を1つずつ取り出しループ
      @order_product = OrderProduct.new #初期化宣言
      @order_product.order_id =  @order.id #order注文idを紐付けておく
      @order_product.product_id = cart_item.product_id #カート内商品idを注文商品idに代入
      @order_product.amount = cart_item.quantity #カート内商品の個数を注文商品の個数に代入
      @order_product.price = (cart_item.product.price*1.08).floor #消費税込みに計算して代入
      @order_product.save #注文商品を保存
    end
    current_customer.cart_items.destroy_all #カートの中身を削除
    redirect_to orders_complite_path
  end

  def complite
  end

  def index
    @orders = current_customer.orders.all
  end

  def show
    @order = Order.current_customer.id
    @order_price = @order.order_product.price
    @order.total_payment = @order.postage + @order_price.to_i
    @order.id = order_products.order_id
  end

  private

  def order_params
    params.require(:order).permit(:postage, :payment_method, :shipping_name, :shipping_address, :shipping_post_code, :customer_id, :billing_amount, :status)
  end
end
