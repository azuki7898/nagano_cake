class Public::OrdersController < ApplicationController
  def new
    @order = current_customer
    @customer = current_customer
  end

  def index
  end

  def show
  end

  def comfirm
  end

  def thanks
  end

end
