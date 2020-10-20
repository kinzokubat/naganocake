class ApplicationController < ActionController::Base



  # ログイン後の画面
  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_top_path(resource.id)
    when Costomer
      costomers_top_path(resource.id)
    end
  end

  # # ログアウト後の画面
  # def after_sign_out_path_for(resource_or_scope)
  #   case resource
  #   when Admin
  #     new_admin_session_path
  #   when Costomer
  #     new_costomer_session_path
  #   end
  # end

end
