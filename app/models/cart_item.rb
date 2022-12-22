class CartItem < ApplicationRecord
  belongs_to :products

  def with_tax_price
    (price * 1.1).floor
  end

  def subtotal
    product.with_tax_price * quantity
  end

end
