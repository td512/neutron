require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get list" do
    get messages_list_url
    assert_response :success
  end

  test "should get count" do
    get messages_count_url
    assert_response :success
  end

  test "should get total" do
    get messages_total_url
    assert_response :success
  end

  test "should get get" do
    get messages_get_url
    assert_response :success
  end

  test "should get update" do
    get messages_update_url
    assert_response :success
  end

  test "should get delete_all" do
    get messages_delete_all_url
    assert_response :success
  end

  test "should get create" do
    get messages_create_url
    assert_response :success
  end

  test "should get update_draft" do
    get messages_update_draft_url
    assert_response :success
  end

  test "should get send" do
    get messages_send_url
    assert_response :success
  end

  test "should get delete" do
    get messages_delete_url
    assert_response :success
  end

  test "should get label" do
    get messages_label_url
    assert_response :success
  end
end
