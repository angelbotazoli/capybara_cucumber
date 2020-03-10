require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'site_prism'
require 'faker'

require_relative 'page_objects'
require_relative 'helpers'
World(PageObjects)
World(Helpers)

Faker::Config.locale = 'pt-BR'

$browser = ENV['BROWSER']

if $data = ENV['DATA']
    $data_test = YAML.load_file(File.dirname(__FILE__) + "/data/#{$data}.yaml")
end

Capybara.register_driver :selenium do |driver|

args = ['window-size=1200,800']

    if ENV['HEADLESS']
        args.push('headless')
        args.push('disable-gpu')      
    end

    if $browser.eql?('chrome')   
        caps = Selenium::WebDriver::Remote::Capabilities.chrome(
            'chromeOptions' => {
                'args' => args
            }
        )
        Capybara::Selenium::Driver.new(driver, browser: :chrome, desired_capabilities: caps)
    elsif $browser.eql?('firefox')
        Capybara::Selenium::Driver.new(
            driver,
            browser: :firefox,
            marionette: true
        )
    end  

end

Capybara.configure do |config|
    config.default_driver = :selenium
    config.app_host = 'https://demo.suiteondemand.com'
end

Capybara.default_max_wait_time = 10