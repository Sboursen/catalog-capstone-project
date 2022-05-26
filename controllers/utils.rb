module Utils
  def self.get_valid_date(name)
    date = ''
    loop do
      puts "#{name}: YYYY-MM-DD"
      date = gets.chomp
      date = Date.parse(date)
      break
    rescue StandardError
      puts 'Invalid date'
    end
    date
  end

  def self.validate_boolean
    loop do
      print 'On spotify? [y/n]'
      on_spotify = gets.chomp
      next if %w[y n].include?(on_spotify.downcase)
      return true if on_spotify.downcase == 'y'

      return false
    end
  end
end
