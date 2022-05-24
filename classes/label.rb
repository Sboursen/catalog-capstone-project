require_relative 'type'

class Label < Type
  attr_accessor :title, :color

  def initialize(title, color)
    super

    @title = title
    @color = color
  end
end
