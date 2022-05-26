require 'date'
require_relative '../classes/book'
require_relative '../classes/label'

describe Label do
  context 'When testing the Label class' do
    before :each do
      @label = Label.new('Important', 'Red')
      @book1 = Book.new('Allen & Unwin', 'bad', Date.new(1954, 7, 29))
      @book2 = Book.new('Scholastic Press', 'good', Date.new(2008, 9, 14))
      @book3 = Book.new('Amazon', 'good', Date.new(2020, 10, 13))
    end

    it 'Creates a label object from the Label class' do
      expect(@label).to be_an_instance_of Label
    end

    it 'Returns the title of the label' do
      expect(@label.title).to eq 'Important'
    end

    it 'Returns the color of the label' do
      expect(@label.color).to eq 'Red'
    end

    it 'Assigns a book to the label' do
      @label.add_item(@book1)
      expect(@book1.label).to eq @label
    end

    it 'Returns a list of books assigned to the label that has a length of 3' do
      @label.add_item(@book1)
      @label.add_item(@book2)
      @label.add_item(@book3)
      expect(@label.items_list.length).to eq 3
    end
  end
end
