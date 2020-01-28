class TrainFaresController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  
  def new
    #https://db3ab8bb0693484da3784077537923fb.vfs.cloud9.us-east-1.amazonaws.com/organizations/1/users/1/train_fares/new
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:user_id])
    @train_fare = @user.requests.build type:'TrainFare'
  end
  
  def create
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:user_id])
    @train_fare = @user.requests.build(train_fare_params)
    if @train_fare.save
      flash[:success] = "申請が完了しました"
      #user show にリダイレクトする
      redirect_to controller: 'users', action: 'show', organization_id: @organization.id, id: @user.id
    else
      render 'new'
    end
  end
  
  private
  def train_fare_params
    params.require(:train_fare).permit(:amount, :type,
                                 :account, :description,
                                 :entarting_station, :via_station, :gettingoff_station)
  end

end
