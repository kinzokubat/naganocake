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

  # 退会するボタンを押した後の処理
  def withdraw
    #現在ログインしているユーザーを@costomersに格納
    @costomer = current_costomer
    #updateで登録情報をfalse(退会済み)に変更
    @costomer.update(is_deleted:false )
    #ログアウトさせる
    reset_session
    #ログイン前のtopページへリダイレクト
    redirect_to root_path
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
