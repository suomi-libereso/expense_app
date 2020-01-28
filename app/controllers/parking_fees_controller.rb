class ParkingFeesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  
  def new
    #https://db8bb0693484da3784077537923fb.vfs.cloud9.us-east-1.amazonaws.com/organizations/1/users/1/parking_fees/new
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:user_id])
    @parking_fee = @user.requests.build type:'TrainFare'
  end
  
  def create
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:user_id])
    @parking_fee = @user.requests.build(parking_fee_params)
    if @parking_fee.save
      flash[:success] = "申請が完了しました"
      #user show にリダイレクトする
      redirect_to controller: 'users', action: 'show', organization_id: @organization.id, id: @user.id
    else
      render 'new'
    end
  end
  
  private
  def parking_fee_params
    params.require(:parking_fee).permit(:amount, :type,
                                 :account, :description)
  end
end
