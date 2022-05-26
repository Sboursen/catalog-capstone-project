require_relative '../classes/label'
require_relative '../classes/genre'
require_relative '../classes/author'

class TypesController
  def initialize
    @labels = []
    @genres = []
    @authors = []

    label_hash.each do |hash|
      label = Label.new(hash[:title], hash[:color])
      @labels << label
    end

    genre_hash.each do |hash|
      genre = Genre.new(hash[:name])
      @genres << genre
    end

    author_hash.each do |hash|
      author = Author.new(hash[:first_name], hash[:last_name])
      @authors << author
    end
  end

  def list_labels
    puts 'The labels list: '
    puts
    @labels.each_with_index do |label, index|
      puts "#{index + 1}) label details:"
      puts "Title: #{label.title}"
      puts "Color: #{label.color}"
      puts
    end
  end

  def list_genres
    puts 'The genres list: '
    puts
    @genres.each_with_index do |genre, index|
      puts "#{index + 1}) genre details:"
      puts "Name: #{genre.name}"
      puts
    end
  end

  def list_authors
    puts 'The authors list: '
    puts
    @authors.each_with_index do |author, index|
      puts "#{index + 1}) author details:"
      puts "First name: #{author.first_name}"
      puts "Last name: #{author.last_name}"
      puts
    end
  end

  private

  def label_hash
    [
      { title: 'Gift', color: 'blue' },
      { title: 'New', color: 'green' },
      { title: 'Important', color: 'red' },
      { title: 'Old', color: 'grey' }
    ]
  end

  def genre_hash
    [
      { name: 'Fantasy' },
      { name: 'Action' },
      { name: 'Pop' },
      { name: 'RnB' },
      { name: 'Classic' },
      { name: 'Thriller' }
    ]
  end

  def author_hash
    [
      { first_name: 'Hayao', last_name: 'Miyazaki' },
      { first_name: 'Taylor', last_name: 'Swift' },
      { first_name: 'Adele', last_name: 'Blue Adkins' },
      { first_name: 'Brandon', last_name: 'Sanderson' },
      { first_name: 'Tappei', last_name: 'Nagatsuki' }
    ]
  end
end
