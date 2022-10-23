require "test_helper"

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get event" do
    get events_event_url
    assert_response :success
  end
end
