class Type
  def initialize
    @id = SecureRandom.uuid
    @items = []
  end

  def add_item(item)
    @items << item
  end
end
