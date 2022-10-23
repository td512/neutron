require "test_helper"

class SettingsControllerTest < ActionDispatch::IntegrationTest
  test "should get password" do
    get settings_password_url
    assert_response :success
  end

  test "should get display" do
    get settings_display_url
    assert_response :success
  end

  test "should get signature" do
    get settings_signature_url
    assert_response :success
  end

  test "should get autosave" do
    get settings_autosave_url
    assert_response :success
  end

  test "should get toggle_blocked_content" do
    get settings_toggle_blocked_content_url
    assert_response :success
  end

  test "should get composer_mode" do
    get settings_composer_mode_url
    assert_response :success
  end

  test "should get view_layout" do
    get settings_view_layout_url
    assert_response :success
  end

  test "should get message_buttons" do
    get settings_message_buttons_url
    assert_response :success
  end

  test "should get theme" do
    get settings_theme_url
    assert_response :success
  end
end
