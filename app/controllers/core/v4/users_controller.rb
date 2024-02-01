# frozen_string_literal: true

require 'sirp'

module Core
  module V4
    # handles user creation and authentication
    class UsersController < Core::V4Controller

      PRIME_LENGTH = 2048

      # see jetbrains://web-storm/navigate/reference?project=WebClients&path=applications/account/src/app/signup/signupActions/handleCreateUser.ts
      # queryCreateUserExternal
      def create
        username = params['Username'].to_s
        # payload = params['Payload']
        auth_params = params['Auth']
        salt = auth_params['Salt'].to_s
        verifier = auth_params['Verifier'].to_s

        # encode verifier to hex
        verifier_hex = verifier.unpack1('H*')

        # encode salt to hex
        salt_hex = salt.unpack1('H*')

        client = SIRP::Client.new(PRIME_LENGTH)
        auth = client.start_authentication

        server_verifier = SIRP::Verifier.new(PRIME_LENGTH)
        sirp_session = server_verifier.get_challenge_and_proof(username, verifier_hex, salt_hex, auth)

        @proof = sirp_session[:proof]
        @challenge = sirp_session[:challenge]
        @salt = salt

        session_id = session[:id]

        sirp_proof_key = "#{session[:id]}_sirp_proof"

        puts "Sirp proof key: #{sirp_proof_key}"

        Rails.cache.write(sirp_proof_key, @proof, expires_in: 5.minutes)
        Rails.cache.write("#{session_id}_sirp_challenge", @challenge, expires_in: 5.minutes)

        puts "Proof: #{Rails.cache.read(sirp_proof_key)}"

        # puts sirp_session.inspect

        render status: :ok, json: @challenge
      end

      def info
        # Parameters: {"Username"=>"dalenw@localhost", "Intent"=>"Proton", "user"=>{}}

        # Should return this proton stuff:
        # {
        #     "Code": 1000,
        #     "Modulus": "-----BEGIN PGP SIGNED MESSAGE-----\nHash: SHA256\n\ncxXyPcFsy9Q3rhnuV+/DmoySYaVErpfnRt9B5at8akDPb4uk2djBsf7gj/dlV8rdjF3GDXgH6DqE1UBihC1aY8QyEjccJMKi2/J2ulsrW0604bnif5RCoZowGIC16Paefs4uaYNPF4yjsAjaPpXpEf2I1jgB21bHPPkouqEI02gxZ4DS/McwMn3AO3vEbln2IhznTybr3QkjBEebtHDYlvt/OHJCMI3mm4Dmu4hmZQOWbL5wtRWcbRW3PDysJH3GUfAmHhiqgj/4GV4BqpP61uy8jGYCXfpzM1QhSMTDawpsqWVgVd4WNNgpiPOAkZhvXPQwCI9Ifk6EJFt0ZfFE3g==\n-----BEGIN PGP SIGNATURE-----\nVersion: ProtonMail\nComment: https://protonmail.com\n\nwl4EARYIABAFAlwB1j4JEDUFhcTpUY8mAADjHAEAriBsbSO1TibvDssp5k2k\ndXrKJIQwCWbZhKBPdmAboCEA/3ZS8sIVrIV6qMf4tdkKK9cwp5YR/gRDbMdI\nRmNCWMIJ\n=wLHJ\n-----END PGP SIGNATURE-----\n",
        #     "ServerEphemeral": "CbzdFOrdSOZbSnoitAWaOCDg+q35I6GS5C8eDq5pEPz6l6wm2trdRo2GyVB+fCq9C6aatfZL/27oD1Qp/1L0JyfoM63jDQTY+Lk4d+6axV5VtrgvDrKc4uhFhy0vdJZzA/sVmmLQajZngHpSMffcO9GLtM3HO7jffRvdKO+WP+1/wWz/aP12wKkFch6cAYdkml5+szEDFLQC5zlqjVzUYYESo8vyDZkTQgzyKcKNLY0alFX43rQ9lixitQiSAwj2323XeojpJonTTgRomU9Vwd+kGRqtmn92s9NnwWiKHTQd61KlKoYk6XlZgp3AnbZj8E+cx0iqfvnrVsbUEppneg==",
        #     "Version": 4,
        #     "Salt": "0s9BHCUxbhP5nQ==",
        #     "SRPSession": "48c99ef17ecabb614e8e41ddfa0c848b"
        # }

        sirp_proof_key = "#{session[:id]}_sirp_proof"

        proof = Rails.cache.read(sirp_proof_key)

        puts 'Proof:'
        # puts @challenge
        puts proof[:s]


        payload = {
          Code: 1000,
          Modulus: Core::V4::AuthController::MODULUS_PAYLOAD[:Modulus],
          ModulusID: Core::V4::AuthController::MODULUS_PAYLOAD[:ModulusID],
          Version: 4,
          Salt: proof[:s],
          SRPSession: SecureRandom.alphanumeric(32) # set SRPSession to random alphanumeric string
        }

        puts "Payload: #{payload.to_json}"

        # we get this error:
        # binaryStringToArray: Data must be in the form of a string

        render status: :ok, json: payload
      end

      def username_available
        if EmailAddress.exists?(params[:Name])
          render status: :conflict, json: { Code: 12_106, Message: 'Username already used' }.to_json
        else
          render status: :ok, json: { Code: 1000 }.to_json
        end
      end
    end
  end
end
