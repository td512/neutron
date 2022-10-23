require "test_helper"

class KeysControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get keys_create_url
    assert_response :success
  end

  test "should get update" do
    get keys_update_url
    assert_response :success
  end
end
