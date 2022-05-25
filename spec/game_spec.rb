require 'date'
require_relative '../classes/game'

describe Game do
  context 'Given multiplayer, last_played_at, and publish_date' do
    it 'creates a new Game object with the correct parameters' do
      multiplayer = 'singleplayer'
      last_played_at = Date.new(2022, 6, 24)
      publish_date = Date.new(2022, 2, 25)

      elden_ring = Game.new(multiplayer, last_played_at, publish_date)

      expect(elden_ring).to be_an_instance_of(Game)
      expect(elden_ring.multiplayer).to eql(multiplayer)
      expect(elden_ring.last_played_at).to eql(last_played_at)
      expect(elden_ring.publish_date).to eql(publish_date)
      expect(elden_ring.author).to be_nil
      expect(elden_ring.genre).to be_nil
      expect(elden_ring.label).to be_nil
    end
  end

  context 'given a Game object' do
    it 'is not archived if the last_played_at is less then two years' do
      elden_ring = Game.new('singleplayer', Date.new(2022, 6, 24), Date.new(2022, 2, 25))

      archived = elden_ring.move_to_archive

      expect(archived).to be_falsy
    end

    it 'is not archived if the publish_date is less then ten years' do
      bannerlord = Game.new('multiplayer', Date.new(2021, 1, 6), Date.new(2020, 3, 30))

      archived = bannerlord.move_to_archive

      expect(archived).to be_falsy
    end

    it 'is archived if the last_played_at is more then two years and the publish_date is less then ten years' do
      skyrim = Game.new('singleplayer', Date.new(2014, 4, 14), Date.new(2011, 11, 11))

      archived = skyrim.move_to_archive

      expect(archived).to be_truthy
    end
  end
end
