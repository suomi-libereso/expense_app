require 'rails_helper'

describe "requests_create", type: :feature do
  before do
    @user = FactoryBot.create(:user)
    sign_in_as(@user)
  end
  #接待飲食費を申請する
  scenario "create eating_entertainment_fee" do
    visit   new_organization_user_eating_entertainment_fee_path(organization_id: @user.organization_id,user_id: @user.id)
    fill_in "eating_entertainment_fee_number_of_people", with: 5
    fill_in "eating_entertainment_fee_amount", with: 10000
    click_button "申請"
    expect(page).to have_content "申請が完了しました"
  end
  #電車賃を申請する
  scenario "admin_user creates a　new user" do
    visit   new_organization_user_train_fare_path(organization_id: @user.organization_id,user_id: @user.id)
    fill_in "train_fares_entarting_station", with: "高尾"
    fill_in "train_fares_via_station", with: "立川"
    fill_in "train_fares_gettingoff_station_station", with: "新宿"
    fill_in "train_fares_amount", with: 1000
    click_button "申請"
    expect(page).to have_content "申請が完了しました"
  end
end
