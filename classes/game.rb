require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, publish_date)
    super publish_date

    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    super() && !recently_played?
  end

  def recently_played?
    (Date.today - @last_played_at).to_f / 365 <= 2
  end
end
