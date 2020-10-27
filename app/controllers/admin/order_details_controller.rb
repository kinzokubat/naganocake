class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
    
    order = @order_detail.order
    if @order_detail.making_status == "making"
      order.update(status: "making")
    elsif @order_detail.making_status == "complete"
      order.update(status: "preparing_to_ship")
    end

    redirect_to admin_order_path(@order_detail.order_id)
  end


  def order_detail_params
     params.require(:order_detail).permit(:making_status)
  end

end
