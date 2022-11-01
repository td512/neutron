class VpnController < ApplicationController
  def location
    begin
      remote_ip_geoip = GEOIP.city(request.remote_ip)
      render json: {
                    Code: 1000, IP: request.remote_ip,
                    Lat: remote_ip_geoip.location.latitude,
                    Long: remote_ip_geoip.location.longitude,
                    Country: remote_ip_geoip.country.iso_code,
                    ISP: GEOIP.isp(request.remote_ip).isp
                    }, status: :ok
    rescue MaxMind::GeoIP2::AddressNotFoundError
      puts "WARNING: Lookup failed for #{request.remote_ip}!"
      render json: {
        Code: 1000, IP: request.remote_ip,
        Lat: 0,
        Long: 0,
        Country: 'XX',
        ISP: 'Null ISP'
      }
    end
  end

  def country_count
    # We set all 3 to 0. Why? We're not a VPN.
    render json: {
                    Code: 1000,
                    Counts: [
                      {MaxTier: 0, Count: 0},
                      {MaxTier: 1, Count: 0},
                      {MaxTier: 2, Count: 0},
                    ]
                  }
  end

  def logicals
    render json: {Code: 1000, LogicalServers: []}
  end
end
