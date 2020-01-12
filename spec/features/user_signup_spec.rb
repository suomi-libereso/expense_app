require 'rails_helper'

RSpec.feature "user_signup", type: :feature do
  #管理ユーザーが新しいユーザーを作成する
  xscenario "admin_user creates a　new user" do
      visit 'users/signup'
      fill_in "Name", with: '鈴木花子'
      fill_in "Email", with: 'hanako@example.com'
      fill_in "Password", with: 'password'
      save_and_open_page
      click_button "新規登録"
      #expect を一つ以上実行する必要がある
      #登録後のページは未実装
      #expect(page).to have_content "事業所登録が完了しました"
    
  end
end
