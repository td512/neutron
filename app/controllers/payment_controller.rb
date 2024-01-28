class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token

  def status
    render status: :ok, json: {Code: 1000, Card: 0, Paypal: 0, Apple: 0, Bitcoin: 0, InApp: 0}.to_json
  end

  def plans
    render status: :ok, json: {
      Code: 1000,
      Plans: [
        ID: "oneplan",
        ParentMetaPlanID: "base",
        Type: 1,
        Name: "oneplan",
        Title: "Neutron's Default Plan",
        MaxDomains: 999999,
        MaxAddresses: 999999,
        MaxCalendars: 999999,
        MaxSpace: 1073741824000000,
        MaxMembers: 999999,
        MaxVPN: 0,
        MaxTier: 2,
        Services: 7,
        Features: 1,
        State: 1,
        Pricing: [
          '1': 000,
          '12': 000,
          '24': 000
        ],
        PeriodEnd: [
          '1': 253402300799,
          '12': 253402300799,
          '24': 253402300799
        ],
        Currency: 'USD',
        Quantity: 1,
        Cycle: 1,
        Amount: 000
      ]
    }.to_json
  end
end
