# Set up environment variable for test database
ENV['RACK_ENV'] ||= 'test'

require File.expand_path("../../config/environment", __FILE__)

require 'minitest/autorun'
require 'minitest/pride'
require 'capybara'
require 'launchy'

module TestHelpers

  # Unit-level test methods
  def teardown
    task_manager.delete_all
    super
  end

  def task_manager
    database = YAML::Store.new('db/task_manager_test')
    @database ||= TaskManager.new(database)
  end

end

# Tell Capybara which controller to run feature tests through
Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
end
