class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
    @addresses = current_costomer.address
    pp  '================='
    pp @addresses
    @costomer = current_costomer
  end

  def create
    @order = Order.new(order_params)
    @addresses = current_costomer.addresses
    @costomer = current_costomer

    if @order.save
    else
    render 'new'
    end
    @cart_items = current_costomer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.making_status = 0
      order_detail.save
    end
    @cart_items.destroy_all
    redirect_to order_complete_path
  end

  def index
    @orders = current_costomer.orders.page(params[:page]).reverse_order
  end

  def comfirm
    @order = Order.new
    p(order_params[:payment_method])
    @order.payment_method = order_params[:payment_method].to_i
    @order.shipping_cost = 800
    @order.costomer_id = current_costomer.id
    @order.status = 0

    @cart_items = current_costomer.cart_items
    @sum = 0
    @cart_items.each do |cart_item|
     @sum += (cart_item.item.price * cart_item.amount * 1.1.round(2)).round
    end

    if params[:order][:city] == "0"
      @order.address = current_costomer.address
      @order.postal_code = current_costomer.postal_code
      @order.name = current_costomer.full_name
    elsif params[:order][:city] == "1"
      @address = Address.find_by(id: params[:order][:address_id])
      @order.address =@address.address
      @order.postal_code =@address.postal_code
      @order.name = @address.name
    elsif params[:order][:city] == "2"
      @address = Address.new(postal_code: params[:order][:postal_code],address: params[:order][:address],name: params[:order][:name])
      @address.save
      @order.address =@address.address
      @order.postal_code =@address.postal_code
      @order.name = @address.name
    end

  end

  def complete
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end


  private
  def order_params
    params.require(:order).permit(
      :postal_code,
      :address,
      :name,
      :shipping_cost,
      :total_payment,
      :payment_method,
      :status,
      :costomer_id)
  end


end
