require 'net/http'
require 'net/https'
require 'json'

# Search the Spotify catalog
def search_raw(options)
  uri = URI('https://api.spotify.com/v1/search')
  uri.query = URI.encode_www_form(options)

  # Create client
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_PEER

  # Create Request
  req =  Net::HTTP::Get.new(uri)

  # Fetch Request
  res = http.request(req)
  # Parse JSON into hashes and arrays
  JSON.parse(res.body)
rescue StandardError => e
  puts "HTTP Request failed (#{e.message})"
end

def search_artists(name)
  json = search_raw('type' => 'artist', 'q' => name)
  artists = json.fetch('artists')
  items = artists.fetch('items')
  items
end

def search_tracks(name)
  json = search_raw('type' => 'track', 'q' => name)
  tracks = json.fetch('tracks')
  items = tracks.fetch('items')
  items
end