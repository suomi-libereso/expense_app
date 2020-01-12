class UsersController < ApplicationController
  def show
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:id])
  end
  
  def new
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.build
  end
  
  def create
  end
  
  def index
    #@organization = Organization.find(current_user.organizatior_id
    @organization = Organization.find(params[:organization_id])
    #@users = @organization.users.all
    @users = @organization.users.paginate(page: params[:page], per_page: 20)
    
  end
  
end