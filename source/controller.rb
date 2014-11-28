# require things

class Game
  def initialize
    # something requiring CardLoader
  end

  def start_game
    # welcome, menu, collect input
  end

  def collect
    # get user input from the View
    input = View.user_input

    # define flow game based on user input (case statement)
      # use View to print returns from Model
      # define how the game ends
  end
end

# Run the game
new_game = Game.new
