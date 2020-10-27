class Public::CartItemsController < ApplicationController


 def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.costomer_id = current_costomer.id
    @cart_item.save
    redirect_to  cart_items_path
 end


  def index
    @cart_items = current_costomer.cart_items
    @sum = 0
    @cart_items.each do |cart_item|
     #byebug
     @sum += (cart_item.item.price * cart_item.amount * 1.1.round(2)).round
    end
  end


  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end

 def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
 end


 # カート内商品データ削除(全て)
 def destroy_all
  CartItem.destroy_all
  redirect_to cart_items_path
 end


 private
  def cart_item_params
    params.require(:cart_item).permit(:costomer_id, :item_id, :amount )
  end


end