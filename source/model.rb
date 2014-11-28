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
  # Models our flashcard objects
  attr_reader :category, :question, :answer
  attr_accessor :answered

  def initialize(args = {})
  # generates flashcard objects based on hash keys (csv fields)
    @category = args[:category]
    @question = args[:question]
    @answer = args[:answer]
  end
end


class Dealer
   include CSVParser

  # Pull data from the csv and parses into hashes
   def initialize
    @file = import("game_questions.csv")
  end

  # Map csv hashes into an individual FlashCard object
   def load_card #(draw card?)
    @cards_array = @file.map{|row| FlashCard.new(row)}
    @cards_array.shift
  end

  #Check users guess agains the answer for the current card.
  def check(card, guess)
    #is it bad that we're calling the FlashCard class's methods on an instance variable of this class?
   guess == card.answer
  end

end

binding pry

#====================UNREFACTORED/PSEUDOCODE==================

# class CheckCard
#   #will take a user's guess and compare it against the actual answer
#   def initialize
#     @card = card
#     @guess = guess
#   end

#   def self.check(card, guess)
#     #is it bad that we're calling the FlashCard class's methods on an instance variable of this class?
#    @guess == @card.answer
#   end

# end

# class CardLoader
#   include CSVParser

#   def initialize
#     @file = import("game_questions.csv")
#     #self.load_card
#   end

#   def load_card
#     @cards_array = @file.map{|row| FlashCard.new(row)}
#     @cards_array.shift
#   end
# end

# include CSVParser


# TODO: pulling only parts of the CSV at the time (as opposed to slurping the entire CSV at once)

# TODO: make sure repeat flashcards are not shown (ie, store flashcard_id)



