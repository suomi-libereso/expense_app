require 'selenium-webdriver'
require 'capybara/rspec'
Capybara.register_driver :headless_chrome do |app|
  browser_options = Selenium::WebDriver::Chrome::Options.new
  browser_options.args << '--headless'
  browser_options.args << '--disable-gpu'
  browser_options.args << '--no-sandbox'
  browser_options.args << '--disable-dev-shm-usage'
  browser_options.args << '--lang=ja'
  browser_options.args << '--window-size=1920,1200'
  # この行がメインの変更
  browser_options.add_preference(:download, default_directory: DownloadHelper::PATH.to_s)
  Capybara::Selenium::Driver.new(
    app, browser: :chrome, options: browser_options
  )
end

Capybara.javascript_driver = :headless_chrome
# Capybara自体の設定、ここではどのドライバーを使うかを設定しています
#Capybara.configure do |capybara_config|
  #capybara_config.default_driver = :selenium_chrome
  #capybara_config.default_max_wait_time = 10 # 一つのテストに10秒以上かかったらタイムアウトするように設定しています
#end
# Capybaraに設定したドライバーの設定をします
#Capybara.register_driver :selenium_chrome do |app|
  #options = Selenium::WebDriver::Chrome::Options.new
  #options.add_argument('headless') # ヘッドレスモードをonにするオプション
  #options.add_argument('--disable-gpu') # 暫定的に必要なフラグとのこと
  #Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
#end

Capybara.javascript_driver = :selenium_chrome_headless