class SessionsController < ApplicationController
  def new
  end
  
  def create
    #@取った方が良い？
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      redirect_to organization_user_path(user.organization,user)
    else
      flash.now[:danger] = 'メールアドレスまたはパスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
