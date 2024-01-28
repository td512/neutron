class DataController < ApplicationController
  skip_before_action :verify_authenticity_token
  def metrics
    render status: :ok, json: {Code: 1000}.to_json
  end
end
