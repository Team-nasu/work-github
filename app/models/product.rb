class Product < ApplicationRecord
  has_many :order_products
  has_many :cart_items
  belongs_to :ge
  enum is_active: { on_sale: 0, out_of_sale: 1 }
  has_one_attached :image





  def get_image(width, height)

    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end


end
