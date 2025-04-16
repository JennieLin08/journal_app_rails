require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "should not save task without task_name, desc, user, and category" do
    task = Task.new
    assert_not task.valid?
    assert_includes task.errors[:task_name], "can't be blank"
    assert_includes task.errors[:desc], "can't be blank"
    assert_includes task.errors[:user], "must exist"
    assert_includes task.errors[:category], "must exist"
  end

  test "should save valid task" do
    task = Task.new(
      task_name: "Complete report",
      desc: "Write and submit the final report",
      user: users(:one),
      category: categories(:one)
    )
    assert task.valid?
  end
end
