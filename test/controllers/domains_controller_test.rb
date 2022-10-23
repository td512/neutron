require "test_helper"

class DomainsControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get domains_get_url
    assert_response :success
  end

  test "should get domain" do
    get domains_domain_url
    assert_response :success
  end

  test "should get available" do
    get domains_available_url
    assert_response :success
  end
end
