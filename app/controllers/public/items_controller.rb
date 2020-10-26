class Public::ItemsController < ApplicationController
  # 会員の商品コントローラ

  def index
    @genre =Genre.find_by(id: params[:genre])
    @genres =Genre.all
   if @genre.nil?
    @items = Item.all
    else
    @items = Item.where(genre_id: @genre.id)
  end

  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def top
    @items = Item.first(4)
    @genres =Genre.all
  end

  def about
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id)
  end


end
