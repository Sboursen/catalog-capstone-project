require_relative 'type'

class Label < Type
  attr_accessor :title, :color

  def initialize(title, color)
    super

    @title = title
    @color = color
  end

  def add_item(item)
    return if @items.include?(item)

    super item
    item.add_label(self)
  end
end
