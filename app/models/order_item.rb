class OrderItem < ApplicationRecord
  belongs_to :meal
  belongs_to :delivery_order
end
