require "test_helper"

class ChallengeControllerTest < ActionDispatch::IntegrationTest
  test "should get challengew" do
    get challenge_challengew_url
    assert_response :success
  end
end
