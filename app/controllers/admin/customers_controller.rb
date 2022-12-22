class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page]).per(10)
    # 10項目まで1ページに表示
  end

  def edit
  end

  def show
    @customer = Customer.find(params[:id])
    
  end
end
