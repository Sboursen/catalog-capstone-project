require_relative '../classes/game'
require_relative 'utils'
require_relative 'query'

class GamesController
  attr_reader :games

  def initialize
    @games = Query.read('games').map { |json| Game.from_json(json) }
  end

  def add_game
    puts '
    Please enter the following information:
    '
    puts 'Multiplayer: '
    multiplayer = gets.chomp
    last_played_at = Utils.get_valid_date('Last played at')
    publish_date = Utils.get_valid_date('Publish date')
    game = Game.new(multiplayer, last_played_at, publish_date)
    @games.push(game)
    puts 'Game got added successfully.'
  end

  def list_games
    if @games.empty?
      puts 'The games list is empty! Please add a game first!'
    else
      puts
      puts 'The game list: '
      puts
      @games.each_with_index do |game, index|
        puts "#{index + 1}) game details:"
        puts "Multiplayer: #{game.multiplayer}"
        puts "Publish Date: #{game.publish_date}"
        puts "Last played: #{game.last_played_at}"
      end
    end
  end

  def store_games
    games = @games.map(&:to_json)
    games_json = JSON.generate(games)
    Query.write('games', games_json)
  end
end
