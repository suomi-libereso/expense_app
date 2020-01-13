require 'rails_helper'

describe "user_signup", type: :feature do
  
  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user, :not_admin)
  end
  
  #管理ユーザーが新しいユーザーを作成する
  scenario "admin_user creates a　new user" do
      sign_in_as(@user)
      visit   new_organization_user_path(organization_id: @user.organization_id)
      fill_in "user_name", with: '山田久美子'
      fill_in "user_email", with: 'kumiko@example.com'
      fill_in "user_password", with: 'password'
      fill_in "user_password_confirmation", with: 'password'
      click_button "新規登録"
      expect(page).to have_content "社員登録が完了しました"
  end
  #一般ユーザーは新しいユーザーを作成できない
  scenario "general_user can't creates a new user" do
      sign_in_as(@other_user)
      visit   new_organization_user_path(organization_id: @other_user.organization_id)
      expect(page).to have_content "アクセスできないページです"
  end
end
