class Public::CostomersController < ApplicationController

  def show
    @costomer = Costomer.find(params[:id])
  end


  def edit
    @costomer = Costomer.find(params[:id])
  end

  def update
    costomer = Costomer.find(params[:id])
    costomer.update(costomer_params)
    redirect_to costomer_path(current_costomer.id)
  end
  
  # 顧客の退会確認画面
  def unsubscribe
  end
  
  # 顧客の退会処理(ステータスの更新)
  def withdraw 
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
