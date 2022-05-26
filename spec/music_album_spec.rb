require_relative '../classes/music_album'

describe MusicAlbum do
  context 'It should create a musicAlbum instance with name, onspotify and published date' do
    music = MusicAlbum.new('Moon trip', true, '1998-09-05')

    it 'creates new musicAlbum with the given parameters' do
      expect(music).to be_an_instance_of MusicAlbum
    end

    it 'Should check the musicAlbum name' do
      expect(music.name).to eq 'Moon trip'
    end

    it 'should check if it can be archived' do
      expect(music.on_spotify).to eq true
    end
  end
end
