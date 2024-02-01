class ApplicationController < ActionController::Base
  before_action :set_cache_headers
  before_action :set_default_cookies

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Mon, 01 Jan 1990 00:00:00 GMT"
  end

  def set_default_cookies

    puts "Session ID: #{session[:id]}" if Rails.env.development?

    # check if the user has a session cookie
    return unless session[:id].blank?

    # if not, set a new session cookie
    session[:id] = SecureRandom.uuid
  end
end
