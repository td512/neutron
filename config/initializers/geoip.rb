begin
  # MaxMind is retarded. Hence .to_s
  GEOIP = MaxMind::GeoIP2::Reader.new(database: Rails.root.join('config', 'geoip', 'GeoIP2-City.mmdb').to_s)
rescue ArgumentError
  puts "/!\\ WARNING: Unable to import MaxMind GeoIP2 City Database! /!\\"
  puts "Make sure you've put GeoIP2-City.mmdb in #{Rails.root.join('config', 'geoip')} and restart the server"
end