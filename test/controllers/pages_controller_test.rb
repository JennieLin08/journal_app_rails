require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :users, :categories

  test "should get home" do
    sign_in users(:one)
    get root_path
    assert_response :success
  end
end
