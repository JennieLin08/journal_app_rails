require "test_helper"

class CategoryTest < ActiveSupport::TestCase
   test "should not save category without category_name, description, and user" do
    category = Category.new
    assert_not category.valid?
    assert_includes category.errors[:category_name], "can't be blank"
    assert_includes category.errors[:description], "can't be blank"
    assert_includes category.errors[:user], "must exist"
  end

  test "should save valid category with user" do
    category = Category.new(
      category_name: "Valid Category",
      description: "A proper description",
      user: users(:one)
    )
    assert category.valid?
  end
end
