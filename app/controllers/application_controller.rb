class ApplicationController < ActionController::Base
  
  
  
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_top_path # ログイン後に遷移するpathを設定
    when Costomer
      items_path     # ログイン後に遷移するpathを設定
    end
  end
end


