require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get contacts_get_url
    assert_response :success
  end

  test "should get create" do
    get contacts_create_url
    assert_response :success
  end

  test "should get delete_all\!" do
    get contacts_delete_all\!_url
    assert_response :success
  end

  test "should get update" do
    get contacts_update_url
    assert_response :success
  end

  test "should get delete" do
    get contacts_delete_url
    assert_response :success
  end
end
