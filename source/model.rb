require "pry"

#==========================PARSER=======================
require "csv"

module CSVParser

  def import file
    CSV.read(file, headers:true, header_converters: :symbol).map {|row| row.to_hash}
  end

  def export(filename, data)
    CSV.open(filename, 'wb') do |csv|
      csv << data.first.keys

      data.each {|row| csv << row.values}
    end
  end
end

#========================= MODEL=========================

class FlashCard
  # Models our flashcards
  attr_reader :category, :question, :answer
  attr_accessor :answered

  def initialize(args = {})
    @category = args[:category]
    @question = args[:question]
    @answer = args[:answer]
    # generate object based on hash keys (csv fields)
  end
end

class CheckCard
  #will take a user's guess and compare it against the actual answer

  def initialize(card, guess)
    @card = card
    @guess = guess
  end

  def self.check
    #is it bad that we're calling the FlashCard class's methods on an instance variable of this class?
   @guess == @card.answer
  end

end

class CardLoader
  include CSVParser
  attr_accessor

  def initialize
    @file = import(@file)
    load_card
  end

  def self.load_card
    @cards_array = @file.map{|row| FlashCard.new(row)}
    @cards_array.shift
  end
end

  # include CSVParser

  # Pull data from the csv and parse into flashcard objects

  # TODO: pulling only parts of the CSV at the time (as opposed to slurping the entire CSV at once)

  # TODO: make sure repeat flashcards are not shown (ie, store flashcard_id)


binding pry
