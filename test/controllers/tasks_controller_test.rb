require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end

  include Devise::Test::IntegrationHelpers
  fixtures :users, :categories

  test "should get index" do
    sign_in users(:one)
    category = categories(:one)

    get category_tasks_path(category)
    assert_response :success
  end

  test "should get show" do
    sign_in users(:one)
    category = categories(:one)
    task = tasks(:one)

    get category_task_path(category,task)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    category = categories(:one)
    task = tasks(:one)

    get edit_category_task_path(category,task)
    assert_response :success
  end

  # test "should create a task" do
  #   sign_in users(:one)
  #   category = categories(:one)

  #   assert_difference("Task.count", 1) do
  #     post category_tasks_path(category), params: {
  #       task: {
  #         task_name: "Test task",
  #         desc: "This is a test task desc"
  #       }
  #     }
  #   end

  #   task = Task.last
  #   assert_redirected_to category_tasks_path(category)
  #   follow_redirect!
  # end
end
