class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_products
  has_many :products, through: :order_products

  enum payment_method: { credit_card: 0, transfer: 1 }

  enum order_status: {
     waiting_for_payment: 0, confirmation_of_payment: 1, in_production: 2, preparing_to_ship: 3, shipped: 4
  }

  def with_tax_price
    (price * 1.1).floor
  end

  # def subtotal
  #   product.with_tax_price *
end