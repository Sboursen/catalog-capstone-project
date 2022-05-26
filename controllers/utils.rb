module Utils
  def self.get_valid_date(name)
    date = ''
    loop do
      begin
        puts "#{name}: YYYY-MM-DD"
        date = gets.chomp
        date = Date.parse(date)
        break
      rescue
        puts 'Invalid date'
      end
    end
    date
  end

  def self.get_valid_boolean
    loop do
        print 'On spotify? [y/n]'
        on_spotify = gets.chomp
        next if ['y', 'n'].include?(on_spotify.downcase)
        return true if on_spotify.downcase == 'y'
        return false
    end
  end
end