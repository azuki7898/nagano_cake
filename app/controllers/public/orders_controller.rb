class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @customer = current_customer
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    if current_customer.cart_items.present?
      @cart_items = current_customer.cart_items
      @order = Order.new(order_params)
      if params[:order][:address_option] == "0"
        @order.postal_code = current_customer.postal_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:address_option] == "1"
        address = Address.find(params[:address][:id]) # <%= f.select :address_id, options_from_collection_for_select( current_end_user.addresses, :id, :address_property)%>の場合、prams[:order][:address_id]となる
        @order.postal_code = address.postal_code
        @order.address = address.address
        @order.name = address.name
      elsif params[:order][:address_option] == "2"
        @address = Address.new
        @address.address = params[:order][:address]
        @address.name = params[:order][:name]
        @address.postal_code = params[:order][:postal_code]
        @address.customer_id = current_customer.id
        if @address.save
          @order.postal_code = @address.postal_code
          @order.name = @address.name
          @order.address = @address.address
        else
          render :new
        end
      end
    else
      flash[:notice] = “カートに商品を入れてください。”
      redirect_to cart_items_path
    end
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = order.order_details.new
      order_detail.item_id = cart_item.item_id
      order_detail.tax_price = (cart_item.item.price * 1.1).round.to_s(:delimited)
      order_detail.quantity = cart_item.amount
      order_detail.save
    end
    current_customer.cart_items.destroy_all
    redirect_to thanks_path
  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :order_price)
  end

end
