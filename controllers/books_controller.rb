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
    puts 'Cover state: good or bad'
    cover_state = gets.chomp
    publish_date = Utils.get_valid_date('Publish date')
    book = Book.new(publisher, cover_state, publish_date)
    @books.push(book)
  end

  def list_books
    if @books.empty?
      puts 'The book list is empty! Please add a book first!'
    else
      puts
      puts 'The book list: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) book detail:"
        print " Publisher: #{book.publisher},
                Publish Date: #{book.publish_date},
                Cover state: #{book.cover_state}"
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
