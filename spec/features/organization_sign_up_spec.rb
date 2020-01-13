require 'rails_helper'

RSpec.feature "organization_signup", type: :feature do
  # ユーザーは新しい organization と adminuser を作成する
  scenario "user creates a new organization and new adminuser" do
      visit  new_organization_path
      #visit 'organizations/new'
      fill_in "organization_name", with: '鈴木商店株式会社'
      fill_in "adminuser_name", with: '鈴木花子'
      fill_in "adminuser_email", with: 'hanako@example.com'
      fill_in "adminuser_password", with: 'password'
      fill_in "adminuser_password_confirmation", with: 'password'
      #save_and_open_page
      click_button "新規登録"
      #expect を一つ以上実行する必要がある
      
      expect(page).to have_content "事業所登録が完了しました"
  end
  # 誤った情報で登録できないことを確認する
  scenario "invalid signup information" do
    visit 'organizations/new'
      fill_in "organization_name", with: ''
      fill_in "adminuser_name", with: ''
      fill_in "adminuser_email", with: 'hanako@example,com'
      fill_in "adminuser_password", with: 'password'
      fill_in "adminuser_password_confirmation", with: 'foobar'
      click_button "新規登録"
      
      expect(page).to have_css("div.alert")
  end
end