class Public::CustomersController < ApplicationController
  def index
  end

  def show
  end

  def check
    add_column :customers, :is_deleted, :boolean, default: false
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  def update
    customer = Customer.find(params[:id])
    customer.update(customer_params)
    redirect_to customer_path
  end

  private

  def customer_params
    params.require(:customer).permit(:is_deleted, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode,:address, :phone_number, :email)
  end
end
