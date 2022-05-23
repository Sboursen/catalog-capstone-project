class App
  def initialize
    @books = []
    @labels = []
    @authors = []
    @music_albums = []
    @genres = []
    @games = []
  end

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
      list_all_books
    when 2
      list_all_music_albums
    when 3
      list_all_games
    when 4
      list_all_genres
    when 5
      list_all_labels
    when 6
      list_all_authors
    end
  end

  def display_add_options(option)
    case option
    when 7
      add_book
    when 8
      add_music_album
    when 9
      add_game
    when 10
      exit(true)
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

  def run
    loop do
      prints_prompt
      user_input = gets.chomp.to_i
      display_options(user_input)
    end
  end
end
