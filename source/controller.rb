require_relative 'model'
require_relative 'view'

class Game
  attr_accessor :current_card, :dealer

  def initialize
    # something to generate new cards
    # @dealer = Dealer.new('game_questions.csv')
    @current_card = nil
    @correctly_answered = []
    @incorrectly_answered = []
  end

  def start_menu
    View.clear
    View.welcome
    case View.user_input
    when '1'
      input = 'Animals'
    when '2'
      input = 'Food'
    when '3'
      input = 'Computers'
    end
    @dealer = Dealer.new('game_questions.csv', input)
    next_card
    play_game
    # if input == 'start'
    #   play_game
    # else
    #   start_menu
    # end
  end

  def play_game
    View.clear
    # show current card's category and question
    View.category_screen(current_card.category)
    View.show_card(current_card.question)

    # get user input from the View
    # TODO: prompt user for answer in View
    guess = View.user_input.downcase

    if guess == 'quit'
      end_game
    else
      # define flow of game based on user input (case statement)
        # use View to print returns from Model
        # define how the game ends
      if dealer.check(@current_card.answer, guess) # is this bad design?
        View.correct
        mark_correct(@current_card)
        sleep 3
      else
        View.incorrect(@current_card.answer)
        mark_incorrect(@current_card)
        sleep 3
      end
      if next_card
        next_card
        play_game
      else
        end_game
      end
    end
  end

  def next_card
    @current_card = dealer.load_card
  end

  def end_game
    View.show_results(@correctly_answered.length, @incorrectly_answered.length)
    exit
  end

  def mark_correct(card_obj)
    @correctly_answered << card_obj
  end

  def mark_incorrect(card_obj)
    @incorrectly_answered << card_obj
  end
end

# Run the game
new_game = Game.new
new_game.start_menu
