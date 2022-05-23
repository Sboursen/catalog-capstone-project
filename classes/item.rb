class Item
  attr_reader :genre, :label, :author
  attr_accessor :publish_date

  def initialize(published_date)
    @id = SecureRandom.uuid
    @publish_date = published_date
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

  def label=(label)
    @label = label
    label.add_item(self)
  end

  def author=(author)
    @author = author
    author.add_item(self)
  end

  def move_to_archive; end

  private

  def can_be_archived?; end
end
