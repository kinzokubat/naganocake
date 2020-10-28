class ApplicationController < ActionController::Base
  
  
  
  before_action :set_search
  
  def set_search
    @search = Item.ransack(params[:q]) #ransackメソッド推奨
    @search_items = @search.result.page(params[:page])
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_top_path # ログイン後に遷移するpathを設定
    when Costomer
      items_path     # ログイン後に遷移するpathを設定
    end
  end
end


