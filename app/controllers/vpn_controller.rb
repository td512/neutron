class VpnController < ApplicationController
  skip_before_action :verify_authenticity_token

  def servers
    render status: :ok, json: {Code: 1000, Servers: 3142, Countries: 71, Capacity: 3676.14}.to_json
  end

  def countries
    render status: :ok, json: {Code: 1000, Counts: [{MaxTier: 0, Count: 0}, {MaxTier: 1, Count: 0}, {MaxTier: 2, Count: 0}]}.to_json unless params[:GroupBy]
    render status: :ok, json: {Code: 1000, Counts: {'0': 0, '2': 0}}.to_json if params[:GroupBy]
  end
end
