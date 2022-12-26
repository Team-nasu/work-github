class OrderProduct < ApplicationRecord
    belongs_to :order
    belongs_to :product

    enum making_status: {
     unable_to_begin: 0, waiting_for_production: 1, in_production: 2, completion_of_production: 3
    }

    def subtotal
        price * amount
    end
end