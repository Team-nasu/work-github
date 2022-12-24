class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :addresses
  has_many :cart_items
  has_many :orders

  # enum is_deleted: {Available: true, Invalid: false}
  #   #有効会員はtrue、退会済み会員はfalse


  # def active_for_authentication?
  #   super && (self.is_deleted === "Invalid")
  # end
end
