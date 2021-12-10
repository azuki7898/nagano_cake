class Admin::OrdersController < ApplicationController

  def index
    @orders = @order.customer

  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end
end
