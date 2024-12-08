# capybara.rb
require 'capybara/rspec'

Capybara.register_driver :headless_firefox do |app|
  options = Selenium::WebDriver::Firefox::Options.new(args: [ '-headless' ])
  Capybara::Selenium::Driver.new(app, browser: :firefox, options: options)
end

Capybara.javascript_driver = :headless_firefox
