require_relative './query'
require_relative '../classes/music_album'
require_relative './utils'

class MusicAlbumsController
  def initialize
    @music_albums = Query.read('albums').map { |json| MusicAlbum.from_json(json) }
  end

  def add_music_album
    puts '
    Please enter the following information:'
    print 'Album name: '
    album = gets.chomp
    on_spotify = Utils.validate_boolean
    publish_date = Utils.get_valid_date('Publish date')
    music_album = MusicAlbum.new(album, on_spotify, publish_date)
    @music_albums.push(music_album)
    puts 'Music album got added successfully.'
  end

  def list_music_albums
    if @music_albums.length.zero?
      puts 'The music album list is empty! Please add a music album first!'
    else
      puts
      puts 'The music albums list: '
      puts
      @music_albums.each_with_index do |album, index|
        puts "#{index + 1}) music album details:"
        puts "Name: #{album.name}"
        puts "Publish date: #{album.publish_date}"
        puts "On spotify: #{album.on_spotify}"
        puts
      end
    end
    @music_albums
  end

  def store_albums
    albums = @music_albums.map(&:to_json)
    albums_json = JSON.generate(albums)
    Query.write('albums', albums_json)
  end
end
