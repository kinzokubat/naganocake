class CostomersController < ApplicationController

  def top
  end

  def index
   @costomers = Costomer.all
  end

  def show
    @costomer = Costomer.find(params[:id])
  end

  def edit
    @costomer = Costomer.find(params[:id])
  end

  def update
    @costomer = Costomer.find(params[:id])
    @costomer.update(costomer_params)
    redirect_to admin_costomers_index_path
  end

  private
  def costomer_params
   params.require(:costomer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted )
  end

end