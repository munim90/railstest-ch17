require "spec_helper"
require "active_record"
require "yaml"
require_relative "../app/models/application_record.rb"

connection_info = YAML.load_file("config/database.yml")["test"] 
ActiveRecord::Base.establish_connection(connection_info)

RSpec.configure do |config|
  config.around do |example|
    ActiveRecord::Base.transaction do 
      example.run
      raise ActiveRecord::Rollback
    end
  end
end