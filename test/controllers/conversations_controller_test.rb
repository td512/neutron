require "test_helper"

class ConversationsControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get conversations_list_url
    assert_response :success
  end

  test "should get get" do
    get conversations_get_url
    assert_response :success
  end

  test "should get count" do
    get conversations_count_url
    assert_response :success
  end

  test "should get update" do
    get conversations_update_url
    assert_response :success
  end

  test "should get delete_all" do
    get conversations_delete_all_url
    assert_response :success
  end

  test "should get delete" do
    get conversations_delete_url
    assert_response :success
  end

  test "should get update_label" do
    get conversations_update_label_url
    assert_response :success
  end
end
