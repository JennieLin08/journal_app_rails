require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
 include Devise::Test::IntegrationHelpers
  fixtures :users, :categories
  setup do
    sign_in users(:one)
  end

  test "should get new" do
    
    get new_category_path
    assert_response :success
  end

  test "should get create and redirect to root path" do
    # sign_in users(:one)
    assert_difference("Category.count", 1) do
      post categories_path, params: {
        category: {
          category_name: "Test Category",
          description: "This is a test category"
        }
      }
    end

    assert_redirected_to root_path
    follow_redirect!
  end

  test "should update and redirect to root path" do
    # sign_in users(:one)
    category = categories(:one)

    patch category_path(category), params: {
      category: {
        category_name: "Updated Cat Name",
        description: "Updated Description"
      }
    }

    assert_redirected_to root_path
    follow_redirect!
    
  end

  test "should get destroy and redirect to root path" do
    # sign_in users(:one)
    category = categories(:one)

     patch category_path(category), params: {
      category: {
        status: false
      }
    }

    assert_redirected_to root_path
    follow_redirect!
  end
end
