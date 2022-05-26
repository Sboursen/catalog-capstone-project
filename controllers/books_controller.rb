require_relative 'query'
require_relative '../classes/book'
require_relative 'utils'

class BooksController
  def initialize
    @books = Query.read('books').map { |json| Book.from_json(json) }
  end

  def add_book
    puts '
    Please enter the following information:
    '
    puts 'Publisher: '
    publisher = gets.chomp
    cover_state = Utils.validate_cover_state
    publish_date = Utils.get_valid_date('Publish date')
    book = Book.new(publisher, cover_state, publish_date)
    @books.push(book)
    puts 'Book got added successfully.'
  end

  def list_books
    if @books.empty?
      puts 'The books list is empty! Please add a book first!'
    else
      puts
      puts 'The book list: '
      puts
      @books.each_with_index do |book, index|
        puts "#{index + 1}) book details:"
        puts "Publisher: #{book.publisher}"
        puts "Publish Date: #{book.publish_date}"
        puts "Cover state: #{book.cover_state}"
        puts
      end
    end
  end

  def store_books
    books = @books.map(&:to_json)
    books_json = JSON.generate(books)
    Query.write('books', books_json)
  end

  private

  def date_validator(date); end
end
