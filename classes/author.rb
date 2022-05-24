require_relative 'type'

class Author < Type
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    super()
    @first_name = first_name
    @last_name = last_name
  end

  def add_item(item)
    return if @items.include?(item)

    super(item)
    item.add_author(self)
  end
end
