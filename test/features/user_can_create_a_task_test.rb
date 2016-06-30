require_relative '../test_helper'

class UserCanCreateATaskTest < FeatureTest
  def current_task_id
    task_manager.all.first.id
  end

  def test_user_can_create_a_task
    visit '/'
    click_link("New Task")

    assert_equal "/tasks/new", current_path

    fill_in "task[title]", with: "new task"
    fill_in "task[description]", with: "new description"
    click_button("Submit")

    assert_equal "/tasks", current_path

    within("##{current_task_id}") do
      assert page.has_content?("new task")
    end
  end
end
