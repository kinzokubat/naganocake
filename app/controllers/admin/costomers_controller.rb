class Admin::CostomersController < ApplicationController

  def top
    @orders = Order.all
  end

  def index
    @costomers = Costomer.page(params[:page]).reverse_order
  end

  def create
    costomer = Costomer.find(params[:id])
    costomer = Costomer.new(costomer_params)
    costomer.save
    redirect_to admin_costomer_path(costomer.id)
  end

  def show
    @costomer = Costomer.find(params[:id])
  end

  def edit
    @costomer = Costomer.find(params[:id])
  end

  def update
    costomer = Costomer.find(params[:id])
    costomer.update(costomer_params)
    redirect_to admin_costomer_path(costomer.id)
  end

  private
  def costomer_params
    params.require(:costomer).permit(
      :last_name,
      :first_name,
      :last_name_kana,
      :first_name_kana,
      :postal_code,
      :address,
      :telephone_number,
      :email,
      :is_deleted)
  end

end
