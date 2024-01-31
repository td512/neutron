# frozen_string_literal: true

require 'sirp'

module Core
  module V4
    class UsersController < Core::V4Controller

      PRIME_LENGTH = 2048

      # see jetbrains://web-storm/navigate/reference?project=WebClients&path=applications/account/src/app/signup/signupActions/handleCreateUser.ts
      # queryCreateUserExternal
      def create
        username = params['Username'].to_s
        payload = params['Payload']
        auth_params = params['Auth']
        salt = auth_params['Salt'].to_s
        verifier = auth_params['Verifier'].to_s

        # encode verifier to hex
        verifier_hex = verifier.unpack('H*').first

        # encode salt to hex
        salt_hex = salt.unpack('H*').first

        client = SIRP::Client.new(PRIME_LENGTH)
        auth = client.start_authentication

        server_verifier = SIRP::Verifier.new(PRIME_LENGTH)
        session = server_verifier.get_challenge_and_proof(username, verifier_hex, salt_hex, auth)

        @proof = session[:proof]

        # puts session.inspect

        render status: :ok, json: session[:challenge]

        # puts auth.inspect
      end

      def username_available
        if EmailAddress.exists?(params[:Name])
          render status: :conflict, json: {Code: 12106, Message: 'Username already used'}.to_json
        else
          render status: :ok, json: {Code: 1000}.to_json
        end
      end
    end
  end
end
