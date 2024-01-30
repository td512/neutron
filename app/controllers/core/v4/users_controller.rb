class Core::V4::UsersController < Core::V4Controller
  def create
    p params
  end

  def username_available
    if EmailAddress.exists?(params[:Name])
      render status: :conflict, json: {Code: 12106, Message: 'Username already used'}.to_json
    else
      render status: :ok, json: {Code: 1000}.to_json
    end
  end
end
