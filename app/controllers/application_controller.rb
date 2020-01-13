class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
    
    # ログイン済みユーザーかどうか確認
    def logged_in_user
      unless logged_in?
        flash[:danger] = "ログインしてください"
        redirect_to login_url
      end
    end
    
    
    # current_userのorganizationが一致していなければリダイレクトさせる
    def correct_organization
      @organization = Organization.find(params[:organization_id])
      unless current_organization?(@organization)
      flash[:danger] = "アクセスできないページです"
      redirect_to(root_url)
      end
    end
    
    # current_userがorganizationのadmin_userでなければリダイレクトさせる
    def admin_user
      @organization = Organization.find(params[:organization_id])
      unless current_organization?(@organization) && current_user.admin?
        flash[:danger] = "アクセスできないページです"
        redirect_to(root_url)
      end
    end
end
