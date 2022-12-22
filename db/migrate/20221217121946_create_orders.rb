class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :postage
      t.string :shipping_address
      t.string :shipping_name
      t.string :shipping_postal_code
      t.integer :order_status
      t.integer :payment_method
      t.integer :billing_amount
      t.timestamps
    end
  end
end
