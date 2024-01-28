class CoreController < ApplicationController
  skip_before_action :verify_authenticity_token
  def features
    code = []
    if params[:Code].include? ','
      params[:Code].split(',').each do |v|
        json = {
          Code: v,
          Type: v == 'Offers' ? 'mixed' : 'boolean',
          Global: false,
          DefaultValue: false,
          Value: false,
          Writable: false
        }.to_json
        code.push(json)
      end
    else
      json = {
        Code: params[:Code],
        Type: params[:Code] == 'Offers' ? 'mixed' : 'boolean',
        Global: false,
        DefaultValue: false,
        Value: false,
        Writable: false
      }.to_json
      code.push(json)
    end

    render json: { Code: 1000, Features:
      JSON.parse("[#{code.join(',')}]"),
    Total: code.count }
  end

  def experiments
    render json: {Code: 1000, Experiments: []}
  end

  def cookies
    render status: :ok, json: {Code: 1000, UID: "fmgroufkavwlre4xiw7ithzxohnb7ovg", LocalID: 0, RefreshCounter: 1}.to_json
  end
end
