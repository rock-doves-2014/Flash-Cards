require_relative 'model'
require_relative 'view'
require_relative 'highscoreparse'

class Game
  attr_reader :user, :score
  attr_accessor :current_card, :dealer

  def initialize
    # something to generate new cards
    @user = nil
    @current_card = nil
    @score = 0
    @correctly_answered = []
    @incorrectly_answered = []
  end

  def self.user
    @user
  end

  # def self.score
  #   @score
  # end

  def start_menu
    View.clear

    View.enter_username
    input = View.user_input
    @user = input.capitalize
    if input.length > 0
      View.choose_category
      case View.user_input
      when '1'
        input = 'Animals'
      when '2'
        input = 'Food'
      when '3'
        input = 'Computers'
      when '4'
        input = 'Sports'
      when '5'
        input = 'Ruby'
      else
        puts "Choosing random category..."
        sleep 1.5
        input = ['Animals','Food','Computers','Sports','Ruby'].sample
      end
      @dealer = Dealer.new('game_questions.csv', input)
      next_card
      play_game
    else
      start_menu
    end
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
        @score+=1
        sleep 1.5
      else
        View.incorrect(@current_card.answer)
        mark_incorrect(@current_card)
        if @incorrectly_answered.length >=3
          end_game
        end
        sleep 1.5
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
    highscore = HighScores.new(@user, @score)
    highscore.players
    highscore.changeScore
    View.show_scores(highscore.sort_players)
    system 'ruby push.rb'
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
system 'ruby pull.rb'
game = Game.new
game.start_menu
