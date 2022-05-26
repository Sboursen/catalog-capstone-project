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
end