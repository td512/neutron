require "test_helper"

class CoreControllerTest < ActionDispatch::IntegrationTest
  test "should get features" do
    get core_features_url
    assert_response :success
  end
end
