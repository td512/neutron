class EventsController < ApplicationController
  def event
  end

  def ping
    render json: { Code: 1000 }
  end
end
