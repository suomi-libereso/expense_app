require 'rails_helper'

RSpec.describe Request, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end
  
  #eating_entertainment_fee
  context "eating_entertainment_fee" do
    before do
      @request = @user.requests.build type:EatingEntertainmentFee
      @request.amount = 1000
      @request.description = "foobar"
      @request.account = "接待交際費"
      @request.number_of_people = 5
    end
    
    it "is valid with amount,account,number_of_people" do
      expect(@request).to be_valid
    end
    
    #request共通 amountがなければ無効
    it "is invalid　wihtout amount" do
      @request.amount = ""
      @request.valid?
      expect(@request.errors[:amount]).to include("を入力してください")
    end
    #request共通 amountが整数かつ1以上かつ11桁以内でなければ無効
    it "is invalid with invalid amount" do
      invalid_figures = [200.5,0,1111111111111]
      invalid_figures.each do |invalid_figure|
        @request.amount = invalid_figure
        @request.valid?
        expect(@request).not_to be_valid
      end
    end
    #request共通 accountがなければ無効
    it "is invalid　wihtout account" do
      @request.account = ""
      @request.valid?
      expect(@request.errors[:account]).to include("を入力してください")
    end
    #eating_entertainment_fee 固有 number_of_people がなければ無効
    it "is invalid without number_of_people" do
      @request.number_of_people = ""
      @request.valid?
      expect(@request.errors[:number_of_people]).to include("を入力してください")
    end
    #eating_entertainment_fee 固有 number_of_people が整数かつ1以上かつ100以下
    it "is invalid with invalid number_of_people" do
     invalid_figures = [200.5,0,1111111111111]
      invalid_figures.each do |invalid_figure|
        @request.number_of_people = invalid_figure
        @request.valid?
        expect(@request).not_to be_valid
      end
    end
  end
  
  
  #training_fee
  context "train_fare" do
    before do
      @request = @user.requests.build type:TrainFare
      @request.amount = 1000
      @request.description = "foobar"
      @request.account = "交通費"
      @request.entarting_station = "高尾"
      @request.via_station = "立川"
      @request.gettingoff_station = "新宿"
    end
    it "is valid with amount,account,entarting_station,via_station,gettingoff_station" do
      expect(@request).to be_valid
    end
    #train_fare 固有 entarting_station がなければ無効
    it "is invalid　wihtout entarting_station" do
      @request.entarting_station = ""
      @request.valid?
      expect(@request.errors[:entarting_station]).to include("を入力してください")
    end
    #entarting_station が31文字以上なら無効であること
    it "is invalid with 31characters entarting_station" do
      @request.entarting_station = "a"*31
      @request.valid?
      expect(@request.errors[:entarting_station]).to include("は30文字以内で入力してください")
    end
    #train_fare 固有 via_station がなければ無効
    it "is invalid　wihtout via_station" do
      @request.via_station = ""
      @request.valid?
      expect(@request.errors[:via_station]).to include("を入力してください")
    end
    #via_station が31文字以上なら無効であること
    it "is invalid with 31characters entarting_station" do
      @request.via_station = "a"*31
      @request.valid?
      expect(@request.errors[:via_station]).to include("は30文字以内で入力してください")
    end
    #train_fare 固有 gettingoff_station がなければ無効
    it "is invalid　wihtout gettingoff_station" do
      @request.gettingoff_station = ""
      @request.valid?
      expect(@request.errors[:gettingoff_station]).to include("を入力してください")
    end
    #gettingoff_station が31文字以上なら無効であること
    it "is invalid with 31characters gettingoff_station" do
      @request.gettingoff_station = "a"*31
      @request.valid?
      expect(@request.errors[:gettingoff_station]).to include("は30文字以内で入力してください")
    end
  end
end
