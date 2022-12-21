class Admin::ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @product = Product.new(product_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @product.save
    # 4. トップ画面へリダイレクト
    redirect_to '/admin/products/new'
  end

  def show
  end

  def edit
  end


    private
  def product_params
    params.require(:product).permit(:name, :introduction, :image)
  end

end
