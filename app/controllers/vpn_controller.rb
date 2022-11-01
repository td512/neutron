class VpnController < ApplicationController
  def location
    remote_ip_geoip = GEOIP.city(request.remote_ip)
    render json: {
                  Code: 1000, IP: request.remote_ip,
                  Lat: remote_ip_geoip.location.latitude,
                  Long: remote_ip_geoip.location.longitude,
                  Country: remote_ip_geoip.country.iso_code,
                  ISP: GEOIP.isp(request.remote_ip).isp
                  }, status: :ok
  end
end
