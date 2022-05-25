require_relative '../classes/author'

describe Author do
  context 'Given first_name and last_name' do
    it 'creates a new Athor object with the correct parameters' do
      first_name = 'Hayao'
      last_name = 'Miyazaki'

      author = Author.new(first_name, last_name)

      expect(author).to be_an_instance_of(Author)
      expect(author.first_name).to eql(first_name)
      expect(author.last_name).to eql(last_name)
      expect(author.items_list).to be_empty
    end
  end

  context 'given a Game object' do
    it 'is possible to add the game object to the items list' do
      elden_ring = Game.new('singleplayer', Date.new(2022, 6, 24), Date.new(2022, 2, 25))
      author = Author.new('Hayao', 'Miyazaki')
      author.add_item(elden_ring)

      items = author.items_list

      expect(items).to include(elden_ring)
    end
  end

  context 'When a Game object is added to the Author' do
    it 'should add a reference to the author in the Game object' do
      elden_ring = Game.new('singleplayer', Date.new(2022, 6, 24), Date.new(2022, 2, 25))
      author = Author.new('Hayao', 'Miyazaki')
      author.add_item(elden_ring)

      ref = elden_ring.author

      expect(ref).to equal(author)
    end

    it 'should not add a duplicate game to the same author' do
      elden_ring = Game.new('singleplayer', Date.new(2022, 6, 24), Date.new(2022, 2, 25))
      author = Author.new('Hayao', 'Miyazaki')
      author.add_item(elden_ring)
      author.add_item(elden_ring)

      items = author.items_list

      expect(items).to include(elden_ring)
      expect(items.length).to eql(1)
    end
  end
end
