require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get plans" do
    get payments_plans_url
    assert_response :success
  end

  test "should get subscriptions" do
    get payments_subscriptions_url
    assert_response :success
  end

  test "should get methods" do
    get payments_methods_url
    assert_response :success
  end
end
