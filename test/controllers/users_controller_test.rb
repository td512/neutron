require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get users_get_url
    assert_response :success
  end

  test "should get create" do
    get users_create_url
    assert_response :success
  end

  test "should get direct" do
    get users_direct_url
    assert_response :success
  end

  test "should get username_available?" do
    get users_username_available?_url
    assert_response :success
  end

  test "should get pubkeys" do
    get users_pubkeys_url
    assert_response :success
  end
end
