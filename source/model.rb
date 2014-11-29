require "pry"

#==========================PARSER=======================
require "csv"

module CSVParser

  def import(file) #category
    CSV.read(file, headers:true, header_converters: :symbol).map {|row| row.to_hash}
  end
    # use CSV.foreach with logic filter out category
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

  def initialize(args = {})
  # generates flashcard objects based on hash keys (csv fields)
    @category = args[:category]
    @question = args[:question]
    @answer = args[:answer]
  end
end


class Dealer
  include CSVParser
  attr_reader :file

  # Pull data from the csv and parses into hashes
  def initialize(file, cat)
    @file = import(file)
    @cards_array = @file.map{|row| FlashCard.new(row) if row[:category] == cat }
    @cards_array.compact!
  end

  # Map csv hashes into an individual FlashCard object
  # add shuffle to randomize drawing
  def load_card
    @cards_array.shuffle!.shift
  end

  #Check users guess agains the answer for the current card.
  def check(answer, guess)
    #is it bad that we're calling the FlashCard class's methods on an instance variable of this class?
    guess.downcase == answer.downcase
  end

end
# binding pry
