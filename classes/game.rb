require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super publish_date

    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    Game.new(json['multiplayer'], json['last_played_at'], json['publish_date'])
  end

  def to_json(*_args)
    as_json.to_json
  end

  private

  def as_json
    {
      multiplayer: @multiplayer,
      last_played_at: @last_played_at,
      publish_date: @publish_date
    }
  end

  def can_be_archived?
    super() && !recently_played?
  end

  def recently_played?
    (Date.today - @last_played_at).to_f / 365 <= 2
  end
end
