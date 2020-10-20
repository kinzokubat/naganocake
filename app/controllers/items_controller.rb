class ItemsController < ApplicationController

  # 管理者の部分
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    item.save
    redirect_to items_path
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path(item.id)
  end


  # 会員の部分

  def costomer_index
    @items = Item.all
  end

  
  def costomer_show
    @item = Item.find(params[:id])
  end



  def costomer_top
    @item = Item.first(4)
    @genres =Genre.all
  end

  def costomer_about
  end



  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :genre_id)
  end



end
