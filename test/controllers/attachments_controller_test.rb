require "test_helper"

class AttachmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get upload" do
    get attachments_upload_url
    assert_response :success
  end

  test "should get get" do
    get attachments_get_url
    assert_response :success
  end

  test "should get delete" do
    get attachments_delete_url
    assert_response :success
  end
end
