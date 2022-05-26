require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, publish_date)
    super publish_date

    @publisher = publisher
    @cover_state = cover_state
  end

  def self.from_json(json)
    json = JSON.parse(json) if json.is_a? String
    Book.new(json['publisher'], json['cover_state'], json['publish_date'])
  end

  def to_json
    as_json.to_json
  end

  private

  def can_be_archived?
    super() || bad_cover_state?
  end

  def bad_cover_state?
    @cover_state == 'bad'
  end

  def as_json
    {
        publisher: @publisher,
        cover_state: @cover_state,
        publish_date: @publish_date
    }
  end
end
