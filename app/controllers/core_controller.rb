class CoreController < ApplicationController
  skip_before_action :verify_authenticity_token

  def modulus
    render status: :ok, json: {
      "Code": 1000,
      "Modulus": "-----BEGIN PGP SIGNED MESSAGE-----\nHash: SHA256\n\na4nlOsn2OJkmDt55AZFDJJK+cNxOETSszJ6Xyd+idoFZ3YMNQ9yL7gr00tur6HRcFcYFGsiRJKMvBmQiHK/ucHDjcZspbZ+HBnli9WaXWca0EHzkzWPM7nLvm5CVOP7ff6qvIWKVmiGEkQyWaWQhaGHazHUU3bT0+XqWYtT8SLFKlz5xmMtsFuwTa7QEhZ5tuSnX2LmFuf50dw5AY5TbVRFXVpfay+2+6Qkg0r734LMSQmZaNaqfBNNn2OfNTNcQeWl18Hc08WhcMsBVzkmPvTcQjkzHUSJC4GTyTMlXwAh7vYkdTacM/zD2G8H7f4RA9hl9abfVr1w+dDbrcguqjg==\n-----BEGIN PGP SIGNATURE-----\nVersion: ProtonMail\nComment: https://protonmail.com\n\nwl4EARYIABAFAlwB1jwJEDUFhcTpUY8mAAC7tQD/XEF6f2S7PS1bDrcdDrZ9\nr0c76cZcO/YDuZxxupzouKwBAIFylRkqVlEmmSBLnHcFI712JwVU+d7qrMRr\nhJKzUzUP\n=MHQH\n-----END PGP SIGNATURE-----\n",
      "ModulusID": "EA_L-n90xfylILgsibUjIwl6bDAYucrmE60M1QuR73IVCZ8WZjPlY-mSXVGOjJ55HxZpaZt0YgWrb9Namn7-Dw=="
    }.to_json
  end
  def username_available
    if EmailAddress.exists?(params[:Name])
      render status: :conflict, json: {Code: 12106, Message: 'Username already used'}.to_json
    else
      render status: :ok, json: {Code: 1000}.to_json
    end
  end
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
