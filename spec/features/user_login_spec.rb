require 'rails_helper'

describe "user_login", type: :feature do

  before do
    @user = FactoryBot.create(:user)
  end
  
  context "valid login information" do
    it "have current_user_information" do
      visit '/login'
      fill_in "user_email_login", with: @user.email
      fill_in "user_password_login", with: @user.password
      click_button "ログイン"
      
      expect(page).to have_selector '.current_user_id', text: "#{@user.id}"
      expect(page).to have_selector '.current_user_name', text: "#{@user.name}"
    end
  end

  context "invalid login information" do
    it "invalid email" do
      visit '/login'
      fill_in "user_email_login", with: ""
      fill_in "user_password_login", with: @user.password
      click_button "ログイン"
      
      expect(page).to have_selector '.alert', text: "メールアドレスまたはパスワードが間違っています"
    end

    it "invalid password" do
      visit '/login'
      fill_in "user_email_login", with: @user.email
      fill_in "user_password_login", with: ""
      click_button "ログイン"
      
      expect(page).to have_selector '.alert', text: "メールアドレスまたはパスワードが間違っています"
    end
  end
  
  xit "login with remembering" do 
    visit '/login'
      fill_in "user_email_login", with: @user.email
      fill_in "user_password_login", with: @user.password
      
      #remember_me をチェック
      check '次回から自動的にログイン'
      
      
      click_button "ログイン"
      
      expect(page).to have_selector '.current_user_id', text: "#{@user.id}"
      expect(page).to have_selector '.current_user_name', text: "#{@user.name}"
      
      #cookieがnilでないことを確認する→いったんやめる
      #expect(response.cookies.signed[:user_id]).to eq @user.id
      #expect(response.cookies['remember_token']).to_not eq nil
      #remember_digestがnilでないことを確認する
      expect(@user.remember_digest).not_to be nil
  end
  
  it "login without remembering" do
    visit '/login'
      fill_in "user_email_login", with: @user.email
      fill_in "user_password_login", with: @user.password
      
      #remember_me をチェックアウト
      uncheck '次回から自動的にログイン'
      
      click_button "ログイン"
      
      
      expect(@user.remember_digest).to be nil
      
      #cookieがnilであることを確認する
      #expect(response.cookies['sample']).to eq 'ok'
  end
end