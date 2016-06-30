require_relative '../test_helper'

class TaskManagerTest < Minitest::Test
  include TestHelpers

  def current_task_id
    task_manager.all.first.id
  end

  def test_it_creates_a_task
    assert_equal 0, task_manager.all.count

    task_manager.create(title: "Watch movies", description: "Yeah, right")

    assert_equal 1, task_manager.all.count

    task = task_manager.find(current_task_id)

    assert_equal "Watch movies", task.title
    assert_equal "Yeah, right", task.description

    assert_instance_of Task, task
  end

  def test_it_can_return_an_array_of_all_tasks
    task_manager.create(title: "Watch movies", description: "Yeah, right")
    task = task_manager.all

    expected = "Watch movies"

    assert_equal expected, task.first.title
  end

  def test_it_can_find_a_task_object_by_id
    task_manager.create(title: "Play games", description: "Yeah, right")
    task = task_manager.find(current_task_id)

    expected = "Play games"

    assert_equal expected, task.title
  end

  def test_it_can_update_an_existing_task
    task_manager.create(title: "Play games", description: "Yeah, right")
    task = task_manager.find(current_task_id)

    expected = "Play games"

    assert_equal expected, task.title

    task_manager.update(current_task_id, {:title => "Read a book", :description => "Hamilton"})
    task = task_manager.find(current_task_id)

    expected = "Read a book"

    assert_equal expected, task.title
  end

  def test_it_can_delete_an_existing_task
    task_manager.create(title: "Watch movies", description: "Yeah, right")
    task_manager.create(title: "Play games", description: "Yeah, right")
    task_1 = task_manager.find(current_task_id)
    task_2 = task_manager.find(current_task_id + 1)

    assert_equal "Watch movies", task_1.title
    assert_equal "Play games", task_2.title
    assert_equal 2, task_manager.all.count

    task_manager.destroy(current_task_id)
    task = task_manager.find(current_task_id)

    assert_equal 1, task_manager.all.count
    assert_equal "Play games", task.title
  end


end
