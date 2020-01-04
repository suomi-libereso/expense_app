class OrganizationsController < ApplicationController
  def new
  @organization=Organization.new
  @organization.users.build
  end
  
  def create
    @organization=Organization.new(organization_params)
    if @organization.save
      flash[:info] = "事業所登録が完了しました"
      redirect_to organizations_signup_url
    else
      render 'new'
    end
  end
  
  private

    def organization_params
      params.require(:organization).permit(:name, users_attributes:[:id, :name, :email, :password, :admin])
    end
end
