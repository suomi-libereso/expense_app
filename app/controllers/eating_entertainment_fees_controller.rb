class EatingEntertainmentFeesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  
  def new
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:user_id])
    @eating_entertainment_fee = @user.requests.build type:'EatingEntertainmentFee'
  end
  
  def create
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:user_id])
    @eating_entertainment_fee = @user.requests.build(eating_entertainment_fee_params)
    if @eating_entertainment_fee.save
      flash[:success] = "申請が完了しました"
      #user show にリダイレクトする
      redirect_to controller: 'users', action: 'show', organization_id: @organization.id, id: @user.id
    else
      render 'new'
    end
  end
  
  private
  def eating_entertainment_fee_params
    params.require(:eating_entertainment_fee).permit(:amount, :type,
                                 :account, :description,
                                 :number_of_people)
  end
end
