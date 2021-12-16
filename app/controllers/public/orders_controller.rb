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
    # session[:order] = Order.new
    # session[:order][:payment_method] = params[:value]

    # if params[:address_value] = 0
    #   session[:order][:postal_code] = current_customer.postal_code
    #   session[:order][:address] = current_customer.address
    #   session[:order][:name] = current_customer.last_name + current_customer.first_name

    # elsif params[:address_value] = 1
    #   address = Address.where(customer_id: current_customer.id)
    #   session[:order][:postal_code] = address.postal_code
    #   session[:order][:address] = address.address
    #   session[:order][:name] = address.name

    # elsif params[:address_value] = 2
    #   session[:order][:postal_code] = params[:postal_code]
    #   session[:order][:address] = params[:address]
    #   session[:order][:name] = params[:name]
    # end
  end

  def index
  end

  def show
  end



  def thanks
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_price)
  end

end
