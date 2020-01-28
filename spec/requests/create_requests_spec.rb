require 'rails_helper'

RSpec.describe "CreateRequests", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end
  context "create with login" do
    before do
      post login_path, params: { session: { email: @user.email,
                                      password: @user.password,
                                      remember_me: '0'} }
    end
    it "responds successfully" do
      get new_organization_user_train_fare_path @user.organization_id,@user.id
      expect(response).to have_http_status(200)
    end
    #正しい情報で申請ができること
    it "creates with valid information" do
      post organization_user_train_fares_path @user.organization_id,@user.id,
      params: { train_fare: { entarting_station: "高尾",
                              via_station: "立川",
                              gettingoff_station: "国立",
                              amount: 300,
                              type: "TrainFare" } }
      expect(response).to redirect_to organization_user_path @user.organization_id,@user.id
    end
    #正しい情報で申請ができること
    it "can't creates successfully with invalid information" do
      post organization_user_train_fares_path @user.organization_id,@user.id,
      params: { train_fare: { entarting_station: "",
                              via_station: "立川",
                              gettingoff_station: "国立",
                              amount: 300,
                              type: "TrainFare" } }
      expect(response).to have_http_status(200)
    end
  end
  context "create without login" do
    it "resoponds unsuccessfully" do
    get new_organization_user_train_fare_path @user.organization_id,@user.id
      expect(response).to have_http_status(302)
      #expect(response.body).to include "ログインしてください"
      expect(response).to redirect_to login_path
    end
  end
end