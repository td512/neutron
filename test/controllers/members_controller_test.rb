require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get members_get_url
    assert_response :success
  end
end
