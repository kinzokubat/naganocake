class Public::CartItemsController < ApplicationController

 def new
    # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
    @cart_item = CartItem.new
 end

 def create
    @cart_item = CartItem.new(cart_item_params)
    # cart_item.admin.id = current.admin.id
    # @cart_item = Item.find(params[:item_id])
    @cart_item.save
    redirect_to  cart_items_path
 end


  def index
    @cart_items = CartItem.all
  end

 private
  def cart_item_params
    params.require(:cart_item).permit(:costomer_id, :item_id, :amount )
  end
end