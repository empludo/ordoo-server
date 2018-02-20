class OrdersController < ApplicationController
  def index
    @all_orders = DeliveryOrder.all.as_json
    render json: @all_orders.as_json(:except => [:order_items])
  end

  def show
    @current_order = DeliveryOrder.find_by(order_id: params[:id]).as_json
    unless @current_order == nil
      render json: @current_order
    else
      render json: {error: "Order does not exist"}
    end
  end
end
