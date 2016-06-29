# Set up environment variable for test database
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'minitest/autorun'
require 'minitest/pride'

module TestHelpers

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @database ||= TaskManager.new(database)
  end

end
