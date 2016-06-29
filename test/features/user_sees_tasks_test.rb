require_relative '../test_helper'

class UserSeesTasksTest < FeatureTest
  def test_test_the_user_sees_index_of_tasks
    task_1 = { title: 'Mow the lawn', description: 'Pick up dog toys first' }
    task_2 = { title: 'Walk the dog', description: 'Try Cheesman first' }
    task_manager.create(task_1)
    task_manager.create(task_2)

    visit '/tasks'

    assert page.has_content?('Mow the lawn')
    assert page.has_content?('Walk the dog')
  end

  def test_the_user_sees_the_dashboard_if_there_are_no_tasks
    visit '/tasks'

    assert page.has_content?('Welcome to the Task Manager')
  end
end
