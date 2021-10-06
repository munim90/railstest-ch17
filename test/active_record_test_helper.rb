require "minitest/autorun"
require "mocha"
require "active_record"
require "active_support/test_case"
require "minitest/reporters"
require_relative "../app/models/application_record.rb"

reporter_options = {color: true}
Minitest::Reporters.use!(
  [Minitest::Reporters::DefaultReporter.new(reporter_options)])

connection_info = YAML.load_file("config/database.yml")["test"]
ActiveRecord::Base.establish_connection(connection_info)

module ActiveSupport
  class TestCase
    teardown do
      ActiveRecord::Base.subclasses.each(&:delete_all)
    end
  end
end