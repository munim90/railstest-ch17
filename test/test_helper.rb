ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require "mocha/minitest"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

end

def assert_select_string(string, *selectors, &block)
  doc_root = Nokogiri::HTML::Document.parse(string).root
  assert_select(doc_root, *selectors, &block)
end

module ActionController
  class TestCase
    include Devise::Test::ControllerHelpers
  end
end

module ActionDispatch
  class IntegrationTest
    include Devise::Test::IntegrationHelpers
  end
end

require 'capybara/rails'
require 'capybara/minitest'

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Capybara::Minitest::Assertions

  # Reset sessions and driver between tests
  teardown do
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end

VCR.configure do |c|
  c.cassette_library_dir = "test/vcr"
  c.hook_into :webmock
  c.ignore_localhost = true
end
