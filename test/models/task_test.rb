require_relative "../test_helper"

class TaskTest < Minitest::Test
  def test_assigns_attributes_correctly
    task = Task.new({"id" => "11", "title" => "Rake", "description" => "Get rid of the leaves"})

    assert_equal "11", task.id
    assert_equal "Rake", task.title
    assert_equal "Get rid of the leaves", task.description
  end
end
