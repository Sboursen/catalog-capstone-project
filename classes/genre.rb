require_relative 'type'

class Genre < Type
  attr_accessor :name

  def initialize(name)
    super()
    @name = name
  end

  def add_item(item)
    return if @items.include?(item)

    super(item)
    item.add_genre(self)
  end
end
