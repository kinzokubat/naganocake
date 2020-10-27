class Public::OrdersController < ApplicationController
  before_action :cart_item, only: [:new]

  def new

    @order = Order.new
    @addresses = current_costomer.address
    pp  '================='
    pp @addresses
    @costomer = current_costomer
    
    @cart_items = current_costomer.cart_items
    @order.shipping_cost = 800
    @sum = 0
    @cart_items.each do |cart_item|
     @sum += (cart_item.item.price * cart_item.amount * 1.1.round(2)).round
    end
  end

  def create
  end

  def index
    @orders = current_costomer.orders.page(params[:page]).reverse_order
  end

  def comfirm
    @order = Order.new(order_params)
    @order.costomer = current_costomer
    session[:新しい住所] = nil
    session[:order] = @order
    @cart_items = current_costomer.cart_items
    @order.shipping_cost = 800
    @sum = 0
    @cart_items.each do |cart_item|
     @sum += (cart_item.item.price * cart_item.amount * 1.1.round(2)).round
    end

    if params[:order][:city] == "自分の住所"
      @order.address = current_costomer.address
      @order.postal_code = current_costomer.postal_code
      @order.name = current_costomer.full_name
    elsif params[:order][:city] == "登録した住所"
      @address = Address.find_by(id: params[:order][:address_id])
      @order.address =@address.address
      @order.postal_code =@address.postal_code
      @order.name = @address.name
    elsif params[:order][:city] == "新しい住所"
      session[:新しい住所] = true
      @address = Address.new(postal_code: params[:order][:postal_code],address: params[:order][:address],name: params[:order][:name])
      @order.address = @address.address
      @order.postal_code = @address.postal_code
      @order.name = @address.name
     
    end


  end

  def complete
    @order = Order.new(session[:order])
    @order.save!
    @cart_items = current_costomer.cart_items
    @cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = @order.id
      order_detail.item_id = cart_item.item.id
      order_detail.amount = cart_item.amount
      order_detail.price = cart_item.item.price
      order_detail.making_status = 0
      order_detail.save!
    end
    @cart_items.destroy_all
    if session[:新しい住所]
      current_costomer.addresses.new(
      {
      postal_code: @order.postal_code,
      address: @order.address,
      name: @order.name
      }
      ).save
    end
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

  # カートが空で行った場合のエラー文
  def cart_item
    unless current_costomer.cart_items.present?
      flash[:error] = "カートが空です！"
      redirect_to cart_items_path
    end
  end



end
