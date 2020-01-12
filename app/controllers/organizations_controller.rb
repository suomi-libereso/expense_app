class OrganizationsController < ApplicationController
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
  
  
  private

    def organization_params
      params.require(:organization).permit(:name, users_attributes:[:id, :name, :email, :password,:password_confirmation, :admin])
    end
end
