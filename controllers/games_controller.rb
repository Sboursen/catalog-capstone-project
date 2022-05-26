require_relative '../classes/game'

class GameController
  attr_reader :games

  def initialize
    @games = Query.read('games').map { |json| Game.from_json(json) }
  end

  def add_game(game)
    new_game = Game.new(game['multiplayer'], game['last_played_at'], game['publish_date'])

    @games.push(new_game)
    puts 'game added successfully!'
  end

  def list_games
    if @games.empty?
      puts 'The game list is empty! Please add a game first!'
    else
      puts
      puts 'The game list: '
      @games.each_with_index do |game, index|
        puts "#{index + 1}) game detail:"
        print " Multiplayer: #{game.multiplayer},
                Publish Date: #{game.publish_date},
                Last played: #{game.last_played_at}"
      end
    end
  end

  def store_games
    games = @games.map(&:to_json)
    games_json = JSON.generate(games)
    Query.write('games', games_json)
  end
end
