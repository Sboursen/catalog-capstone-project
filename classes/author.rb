require_relative 'type'

class Author < Type
  attr_accessor :first_name, :last_name

  def initialize(first_name, last_name)
    super

    @first_name = first_name
    @last_name = last_name
  end
end
