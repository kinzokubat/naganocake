class Public::ItemsController < ApplicationController
  # 会員の商品コントローラ

  def index
    @items = Item.all
    @genres =Genre.all
  end

  def show
    @item = Item.find(params[:id])
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
