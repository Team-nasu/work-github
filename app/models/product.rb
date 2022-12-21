class Product < ApplicationRecord
  has_many :cart_items
  enum is_active: { on_sale: 0, out_of_sale: 1 }
  has_one_attached :image
end
