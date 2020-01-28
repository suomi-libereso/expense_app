class OrganizationsController < ApplicationController
  #before_action :logged_in_user, expect: [:new, :create]
  before_action :logged_in_user, only: [:organization_requests_index]
  before_action :correct_organization , only: [:organization_requests_index]
  
  def new
  @organization=Organization.new
  @user = @organization.users.build
  end
  
  def create
    @organization=Organization.new(organization_params)
    #@user = @organization.users.build(organization_params[:users_attributes])
    if @organization.save
      flash[:success] = "事業所登録が完了しました"
      
      @user = @organization.users.first
      #登録したユーザーでログイン
      log_in @user
      
      redirect_to controller: 'users', action: 'index', organization_id: @organization.id 
      
      #redirect_to controller: :organization, action: :show, id: @organization.id
      #redirect_to organization_user_path(@user.organization,@user)
      #redirect_to organization_users_path(@user.organization,@user)
    else
      render 'new'
    end
  end
  
  def organization_requests_index
    @organization = Organization.find(params[:id])
    @requests = @organization.requests.paginate(page: params[:page], per_page: 20)
    
  end
  
  
  private

    def organization_params
      params.require(:organization).permit(:name, users_attributes:[:id, :name, :email, :password,:password_confirmation, :admin])
    end
end
