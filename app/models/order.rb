class Order < ApplicationRecord
  has_many :order_products
  has_many :products, through: :order_products 
  
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
end