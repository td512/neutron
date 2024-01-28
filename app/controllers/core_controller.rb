class CoreController < ApplicationController
  skip_before_action :verify_authenticity_token
  def features
    render json: { Code: 1000, Features: [
      Code: params[:Code],
      Type: 'boolean',
      Global: false,
      DefaultValue: false,
      Value: false,
      Writable: false
    ],
    Total: 1 }
  end

  def cookies
    render status: :ok, json: {Code: 1000, UID: "fmgroufkavwlre4xiw7ithzxohnb7ovg", LocalID: 0, RefreshCounter: 1}.to_json
  end
end
