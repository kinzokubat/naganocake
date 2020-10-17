class ItemsController < ApplicationController
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
  end

  def destroy
  end

  private
  def item_params
    params.require(:item).permit(:name, :introduction, :price)
  end

end
