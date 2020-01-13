class UsersController < ApplicationController
  before_action :logged_in_user
  before_action :correct_organization
  before_action :admin_user, only: [:new, :create]
  
  
  def show
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:id])
  end
  
  def new
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.build
  end
  
  def create
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.build(user_params)
    if @user.save
      flash[:success] = "社員登録が完了しました"
      redirect_to controller: 'users', action: 'index', organization_id: @organization.id
    else
      render 'new'
    end
  end
  
  def index
    #@organization = Organization.find(current_user.organizatior_id
    @organization = Organization.find(params[:organization_id])
    #@users = @organization.users.all
    @users = @organization.users.paginate(page: params[:page], per_page: 20)
    
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:admin)
  end

  
end