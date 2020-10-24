class Public::OrdersController < ApplicationController

  def new
    @order = Order.new
    @addresses = current_costomer.addresses
    pp  '================='
    pp @addresses
    @costomer = current_costomer
  end

  def create
    @order = Order.new(order_params)
    @addresses = current_costomer.addresses
    @costomer = current_costomer
    @genre.save
      redirect_to orders_path
  end

end

