require_relative '../controllers/types_controller'
require_relative '../controllers/books_controller'
require_relative '../controllers/music_albums_controller'
require_relative '../controllers/games_controller'

class App
  def initialize
    @types_controller = TypesController.new
    @books_controller = BooksController.new
    @music_albums_controller = MusicAlbumsController.new
    @games_controller = GamesController.new
  end

  def run
    puts
    puts 'Hello'
    puts 'Welcome to your catalog app!'
    loop do
      prints_prompt
      user_input = gets.chomp.to_i
      display_options(user_input)
    end
  end

  private

  def display_options(option)
    case option
    when 1, 2, 3, 4, 5, 6
      display_list_options(option)
    when 7, 8, 9, 10
      display_add_options(option)
    else
      puts 'Invalid option'
      prints_prompt
    end
  end

  def display_list_options(option)
    case option
    when 1
      @books_controller.list_books
    when 2
      @music_albums_controller.list_music_albums
    when 3
      @games_controller.list_games
    when 4
      @types_controller.list_genres
    when 5
      @types_controller.list_labels
    when 6
      @types_controller.list_authors
    end
  end

  def display_add_options(option)
    case option
    when 7
      @books_controller.add_book
    when 8
      @music_albums_controller.add_music_album
    when 9
      @games_controller.add_game
    when 10
      exit_app
    end
  end

  def prints_prompt
    puts '
    01 - List all books
    02 - List all music albums
    03 - List of games
    04 - List all genres
    05 - List all labels
    06 - List all authors
    07 - Add a book
    08 - Add a music album
    09 - Add a game
    10 - Exit

    Please select an option
    '
  end

  def exit_app
    @books_controller.store_books
    @games_controller.store_games
    @music_albums_controller.store_albums
    puts 'Goodbye!'
    exit(true)
  end
end
