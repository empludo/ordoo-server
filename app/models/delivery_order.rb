class DeliveryOrder < ApplicationRecord
  has_many :order_items
  # validates :order_items, :length => { :minimum => 1 }
  def as_json
    @order_items = OrderItem.where(delivery_order: self.id).map do |item|
    {
      name: Meal.find(item.meal_id).name,
      quantity: item.quantity,
      total_price: item.quantity * item.unit_price
    }
    end

    json = {
      :order_id => self.order_id,
      :delivery_date => self.serving_datetime.to_date,
      :delivery_time => self.serving_datetime.strftime('%H:%M%p') + "-" + (self.serving_datetime + 30*60).strftime('%H:%M%p'),
      :order_items => @order_items
    }
  end
end
