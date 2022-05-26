require_relative './query'
require_relative 'book'
require 'date'

class BooksController
  def initialize
    @books = Query.read('books').map { |json| Book.from_json(json) }
  end

  def add_book(book_hash)
    book = Book.new(book_hash[:publisher], book_hash[:cover_state], Date.parse(book_hash[:publish_date]))
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
end
