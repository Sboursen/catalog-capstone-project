require_relative './query'
require_relative 'book'
require 'date'

class BookController
  def initialize
    @books = Query.read('books').map { |json| Book.from_json(json) }
  end

  def add_book(book_hash)
    book = Book.new(book_hash[:publisher], book_hash[:cover_state], Date.parse(book_hash[:publish_date]))
    @books.push(book)
  end

  def list_books
    if @books.length.zero?
      puts 'The book list is empty! Please add a book first!'
    else
      puts
      puts 'The book list: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}- Publisher: #{book.publisher}, Cover state: #{book.cover_state}, Publish date: #{book.publish_date}"
      end
    end
    @books
  end

  def store_books
    books = @books.map(&:to_json)
    books_json = JSON.generate(books)
    Query.write('books', books_json)
  end
end