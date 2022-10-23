require "test_helper"

class OrganizationsControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get organizations_get_url
    assert_response :success
  end
end
