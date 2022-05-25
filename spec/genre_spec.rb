require_relative '../classes/genre'
require_relative '../classes/music_album'

describe Genre do
  context 'It should create a Genre instance with name' do
    genre = Genre.new('Electro')
    music_album = MusicAlbum.new('Life', true, '2022-05-25')

    it 'creates new Genre with the given parameters' do
      expect(genre).to be_an_instance_of Genre
    end
    it 'Should check the Genre name' do
      expect(genre.name).to eq 'Electro'
    end

    it 'should add music_album item object to genre items array' do
      genre.add_item(music_album)
      expect(genre.items_list[0]).to eq music_album
    end
  end
end
