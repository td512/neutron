require "test_helper"

class AddressesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get addresses_create_url
    assert_response :success
  end

  test "should get toggle" do
    get addresses_toggle_url
    assert_response :success
  end

  test "should get delete" do
    get addresses_delete_url
    assert_response :success
  end
end
