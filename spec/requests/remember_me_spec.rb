require 'rails_helper'

RSpec.describe "Remember me", type: :request do
  before do
    @user = FactoryBot.create(:user)
  end

  # remember_meチェックボックスのテスト
  context "login with remembering" do
    it "remembers cookies" do
      post login_path, params: { session: { email: @user.email,
                                      password: @user.password,
                                      remember_me: '1'} }
      expect(response.cookies['remember_token']).to_not be nil
    end
  end 

  context "login without remembering" do
    it "doesn't remember cookies"do
      # クッキーを保存してログイン
      post login_path, params: { session: { email: @user.email,
                                      password: @user.password,
                                      remember_me: '1'} }
      delete logout_path
      expect(response.cookies['remember_token']).to be nil
      # クッキーを保存せずにログイン
      post login_path, params: { session: { email: @user.email,
                                      password: @user.password,
                                      remember_me: '0'} }
      expect(response.cookies['remember_token']).to be nil
    end
  end
end