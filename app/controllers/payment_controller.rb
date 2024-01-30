class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token

  def subscription
    render status: :ok, json: {Code: 1000}.to_json
  end
  def status
    render status: :ok, json: {Code: 1000, Card: 0, Paypal: 0, Apple: 0, Bitcoin: 0, InApp: 0}.to_json
  end

  def plans
    payload =  {
      "Code": 1000,
      "Plans": [
        {
          "ID": "vXOiCO533JxXlqJsrhvREDwaFhGOXXV7NYjsz06VDJGSnes72blaG8hA9547xU1NLrMsDbA3lywhjPZ7oNYNcA==",
          "ParentMetaPlanID": "hUcV0_EeNwUmXA6EoyNrtO-ZTD8H8F6LvNaSjMaPxB5ecFkA7y-5kc3q38cGumJENGHjtSoUndkYFUx0_xlJeg==",
          "Type": 1,
          "Name": "mail2022",
          "Title": "One Plan™",
          "MaxDomains": 999999,
          "MaxAddresses": 999999,
          "MaxCalendars": 999999,
          "MaxSpace": 1073741824000000,
          "MaxMembers": 999999,
          "MaxVPN": 0,
          "MaxTier": 0,
          "Services": 1,
          "Features": 1,
          "State": 1,
          "Pricing": {
            "1": 0,
            "12": 0,
            "24": 0
          },
          "DefaultPricing": {
            "1": 499,
            "12": 4788,
            "24": 8376
          },
          "PeriodEnd": {
            "1": 253402300799,
            "12": 253402300799,
            "24": 253402300799
          },
          "Currency": "USD",
          "Quantity": 1,
          "Offers": [],
          "Cycle": 1,
          "Amount": 0,
          "Vendors": {
            "Google": {
              "Plans": {},
              "CustomerID": ""
            },
            "Apple": {
              "Plans": {},
              "CustomerID": ""
            }
          }
        }
      ]
    }


    render status: :ok, json: payload.to_json
  end
end
