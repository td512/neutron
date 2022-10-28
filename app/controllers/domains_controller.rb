class DomainsController < ApplicationController
  def get
  end

  def domain
    render json: { Code: 1000, Domains: [ ServerSetting.first.domains { |d| d.split(',') } ] }
  end

  def available
  end
end
