require 'byebug'

class Player
  attr_reader :instance_variables, :user_name
  def initialize(args)
    @instance_variables = args
    @user_name = args[:user]
    @score = args[:score]
  end
end


class HighScores

  include CSVParser
  attr_reader :user, :final_score
  def initialize(user, score)
    @user = user #Fred
    @final_score = score #0
    @file = "highscores.csv"
    @players = nil
  end

#addition
  # def make_player
  #   @current_user = Player.new({user: @user, score: @final_score})
  # end

  def players
    return @players if @players
    @players = import(@file).map {|player| Player.new player}
  end

  def add_player_to_highscores
    @current_player_hash = {user_name: @user, score: @final_score.to_s}
    @players << Player.new(player_hash)
  end

  def save
    players_as_hashes = @players.map(&:instance_variables)
    export('highscores.csv', players_as_hashes)
  end

  def changeScore
    # @players << make_player
    @players.each do |player_object|
      player_object.instance_variables.each do |key, value|
        if value == @user && player_object.instance_variables[:score].to_i < @final_score
          player_object.instance_variables[:score] = @final_score.to_s
        elsif player_does_not_exist
          add_player_to_highscores
        end
      end
    end
    save
  end

  def player_does_not_exist
    existing_users = []
    byebug
    @players.each do |player_object|
      existing_users <<  player_object.user_name
      # p existing_users
      # p existing_users.include?(@user)
    end
      if existing_users.include?(@user)
        false
      else
        true
      end
    end
  end

