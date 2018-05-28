
require 'minitest/autorun'

require 'bundler/setup'
require 'capybara/dsl'
require 'rack/jekyll'

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
