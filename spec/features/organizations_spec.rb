require 'rails_helper'

RSpec.feature "Organizations", type: :feature do
  # ユーザーは新しい organization と adminuser を作成する
  # nameタグがorganizationとuserで重複しているがどう指定するんだろう？
  scenario "user creates a new organization and new adminuser" do
      visit 'organizations/signup'
      fill_in "organization_name", with: '鈴木商店株式会社'
      #find("#organization_name").set("鈴木商店株式会社")
      fill_in "adminuser_name", with: '鈴木花子'
      fill_in "adminuser_email", with: 'hanako@example.com'
      fill_in "adminuser_password", with: 'password'
      #save_and_open_page
      click_button "新規登録"
      #expect を一つ以上実行する必要がある
      #登録後のページは未実装
      expect(page).to have_content "事業所登録が完了しました"
    
  end
end
