module LoginSupport
  def sign_in_as(user)
    visit '/login'
    fill_in "user_email_login", with: user.email
    fill_in "user_password_login", with: user.password
    click_button "ログイン"
  end
end
 
RSpec.configure do |config|
   config.include LoginSupport
end