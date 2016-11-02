require_relative 'spotifyapi'

def artist_menu
    puts 'Search for an artist:'
    print '> '
    artist_name = gets.chomp

    artists = search_artists(artist_name)
    artists.each do |artist|
        name = artist['name']
        follower_count = artist['followers']['total']
        genres = artist['genres']

        puts "## #{ name } ##"
        puts "Has #{ follower_count} followers"

        print 'Genres: '
        puts genres.join(', ')

        puts ''
    end
end

def track_menu
    puts 'Search for a track:'
    print '> '
    track_name = gets.chomp

    tracks = search_tracks(track_name)
    tracks.each do |track|
        name = track['name']
        album = track['album']
        artists = track['artists']

        puts "## #{ name } ##"

        unless album.nil?
            puts "Part of album #{ album['name'] }"
        end

        print 'Artists: '
        # Display each artist's name
        puts artists.map{ |artist| artist['name'] }.join(', ')

        puts ''
    end
end

def main_menu
    loop do
        puts '1. Search artists'
        puts '2. Search tracks'
        puts 'E[x]it'
        choice = gets.chomp

        case choice
        when '1'
            artist_menu
        when '2'
            track_menu
        when 'x'
            break
        end
    end
end

main_menu