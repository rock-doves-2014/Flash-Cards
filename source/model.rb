class FlashCard
  # Models our flashcards
  attr_reader :category, :question, :answer
  attr_accessor :answered

  def initialize
    # generate object based on hash keys (csv fields)
  end
end

class CardLoader
  # include CSVParser

  # Pull data from the csv and parse into flashcard objects

  # TODO: pulling only parts of the CSV at the time (as opposed to slurping the entire CSV at once)

  # TODO: make sure repeat flashcards are not shown (ie, store flashcard_id)
end
