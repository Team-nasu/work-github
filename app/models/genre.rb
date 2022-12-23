class Genre < ApplicationRecord
  has_many :products
  enum name: { cake: 0, pudding: 1, baked_sweets: 2, candy: 3 }
  # ケーキ、プリン、焼き菓子、キャンディ
end
