require_relative 'item'

class MusicAlbum < Item
  attr_accessor :name, :on_spotify

  def initialize(name, on_spotify, publish_date)
    super publish_date

    @name = name
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end

  def on_spotify?
    @on_spotify == true
  end
end
