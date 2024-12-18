require 'rspotify'
begin
  credentials = {
    client_id: ENV['SPOTIFY_CLIENT_ID'],
    client_secret: ENV['SPOTIFY_CLIENT_SECRET']
  }

  puts "Attempting to authenticate with credentials:"
  puts "Client ID: #{ENV['SPOTIFY_CLIENT_ID'].nil? ? 'NOT SET' : 'SET'}"
  puts "Client Secret: #{ENV['SPOTIFY_CLIENT_SECRET'].nil? ? 'NOT SET' : 'SET'}"

  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
rescue RestClient::BadRequest => e
  puts "Authentication failed: #{e.message}"
rescue => e
  puts "Unexpected error: #{e.message}"
end
