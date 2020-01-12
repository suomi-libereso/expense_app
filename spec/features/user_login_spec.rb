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
end