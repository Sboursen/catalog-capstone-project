require 'date'
require_relative '../classes/book'

describe Book do
  context 'When testing the Book class' do
    before :each do
      @book1 = Book.new('Allen & Unwin', 'bad', Date.new(1954, 7, 29))
      @book2 = Book.new('Scholastic Press', 'good', Date.new(2008, 9, 14))
      @book3 = Book.new('Amazon', 'good', Date.new(2020, 10, 13))
    end

    it 'Creates a book object from the Book class' do
      expect(@book1).to be_an_instance_of Book
      expect(@book2).to be_an_instance_of Book
      expect(@book3).to be_an_instance_of Book
    end

    it 'Returns for the publisher of the book' do
      expect(@book1.publisher).to eq 'Allen & Unwin'
      expect(@book2.publisher).to eq 'Scholastic Press'
      expect(@book3.publisher).to eq 'Amazon'
    end

    it 'Returns for the cover_state of the book' do
      expect(@book1.cover_state).to eq 'bad'
      expect(@book2.cover_state).to eq 'good'
      expect(@book3.cover_state).to eq 'good'
    end
  end
end
