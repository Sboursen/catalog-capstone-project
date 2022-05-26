require 'securerandom'

class Type
  def initialize
    @id = SecureRandom.uuid
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def items_list
    @items
  end
end
