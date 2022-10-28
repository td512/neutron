class CoreController < ApplicationController
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
end
