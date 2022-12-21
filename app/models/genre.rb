class Genre < ApplicationRecord
  enum name: { cake: 0, pudding: 1, baked_sweets: 2, candy: 3 }
  # ケーキ、プリン、焼き菓子、キャンディ
end
