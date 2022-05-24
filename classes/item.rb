require 'securerandom'

class Item
  attr_reader :genre, :label, :author
  attr_accessor :publish_date

  def initialize(publish_date)
    @id = SecureRandom.uuid
    @publish_date = publish_date
    @archived = false
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self)
  end

  def add_label(label)
    @label = label
    label.add_item(self)
  end

  def add_author(author)
    @author = author
    @author.add_item(self) unless @author.items_list.include?(self)
  end

  def move_to_archive
    @archive = true if can_be_archived?
  end

  private

  def can_be_archived?
    return true if (Date.today - @publish_date).to_f / 365 > 10

    false
  end
end
