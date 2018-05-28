require 'minitest/autorun'
require 'minitest/pride'
require 'bundler/setup'
require 'capybara/dsl'
require 'rack/jekyll'
require 'awesome_print'

Capybara.app = Rack::Jekyll.new(force_build: true)

sleep 2 # wait until page is built...

class CapybaraTestCase < MiniTest::Test
  include Capybara::DSL

  def setup
    Capybara.default_driver = :selenium
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

class DvriSettingTest
  def self.root_path
    File.expand_path("..", __dir__)
  end
end
