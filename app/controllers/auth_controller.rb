class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  def auth
  end

  def delete
  end

  def cookies
  end

  def info
  end

  def sessions
    render status: :ok, json: {
      Code: 1000, AccessToken: "vuy3gxa7t5wno4gwzaxmpp5wijmhngsd", RefreshToken: "3tn6cfdxdbnbnghqbxe3tsl2fgzda5f4",
      TokenType: "Bearer", Scopes: [], UID: "fmgroufkavwlre4xiw7ithzxohnb7ovg", LocalID: 0 }.to_json
  end
end
