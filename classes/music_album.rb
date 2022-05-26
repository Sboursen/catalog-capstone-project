require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify

  def initialize(name, on_spotify, publish_date)
    super publish_date

    @name = name
    @on_spotify = on_spotify
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    MusicAlbum.new(json['name'], json['on_spotify'], json['publish_date'])
  end

  def to_json(*_args)
    as_json.to_json
  end

  private

  def can_be_archived?
    super && @on_spotify
  end

  def on_spotify?
    @on_spotify == true
  end

  def as_json
    {
      name: @name,
      on_spotify: @on_spotify,
      publish_date: @publish_date
    }
  end
end
