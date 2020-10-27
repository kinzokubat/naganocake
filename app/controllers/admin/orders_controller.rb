class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.find_by(id: params[:costomer])
    @sum = 0
    if @orders.nil?
    @orders = Order.all
   else
    @orders = Order.where(costomer_id: @costomer.id)
   end
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order)
  end

  private
  def order_params
     params.require(:order).permit(:status)
  end


end
