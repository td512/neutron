require "test_helper"

class AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get auth" do
    get auth_auth_url
    assert_response :success
  end

  test "should get delete" do
    get auth_delete_url
    assert_response :success
  end

  test "should get cookies" do
    get auth_cookies_url
    assert_response :success
  end

  test "should get info" do
    get auth_info_url
    assert_response :success
  end
end
