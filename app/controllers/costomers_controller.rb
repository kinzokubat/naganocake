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


  private
  def costomer_params
   params.require(:costomer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email )
  end

end