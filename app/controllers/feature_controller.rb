class FeatureController < ApplicationController
  def frontend
    render status: :ok, json: {
      "Code": 1000,
      "toggles": [
        {
          "name": "BF2023IsExpired",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "BF2023OfferCheck",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "BlackFriday",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "BlackFridayCustomLogic",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "DesktopAppUpsellModal",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "EdDSAFaultySignatureCheck",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "EmailForwarding",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "KeyTransparencyLogOnly",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "KeyTransparencyShowUI",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "PassWebAppLink",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "ScheduledSubscriptions",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "SentinelPassPlus",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "SSOVpnSettings",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "VisionarySignup",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        },
        {
          "name": "WebMailPageSizeSetting",
          "enabled": true,
          "impressionData": false,
          "variant": {
            "name": "disabled",
            "enabled": false
          }
        }
      ]
    }.to_json
  end
end
