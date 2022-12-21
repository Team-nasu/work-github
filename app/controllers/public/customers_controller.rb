class Public::CustomersController < ApplicationController
  def index
  end

  def show
  end

  def check
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  def update
  end
end
