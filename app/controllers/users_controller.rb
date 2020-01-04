class UsersController < ApplicationController
  def new
    @user=User.new
  end
  def create
  end
  def index
    #@organization = Organization.find(current_user.organizatior_id
  end
end