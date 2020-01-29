class TrainingFeesController < ApplicationController
  before_action :logged_in_user
  before_action :correct_user
  
  def new
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:user_id])
    @training_fee = @user.requests.build type:'TrainingFee'
  end
  
  def create
    @organization = Organization.find(params[:organization_id])
    @user = @organization.users.find(params[:user_id])
    @training_fee = @user.requests.build(training_fee_params)
    if @training_fee.save
      flash[:success] = "申請が完了しました"
      #user show にリダイレクトする
      redirect_to controller: 'users', action: 'show', organization_id: @organization.id, id: @user.id
    else
      render 'new'
    end
  end
  
  private
  def training_fee_params
    params.require(:training_fee).permit(:amount, :type,
                                 :account, :description)
  end
end
