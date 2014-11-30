# require 'byebug'
class Player
  attr_accessor :instance_variables, :user_name, :score
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
    @user = user
    @final_score = score
    @file = "highscores.csv"
    @players = nil
  end

  def players
    return @players if @players
    @players = import(@file).map {|player| Player.new player}
  end

  def add_player_to_highscores
    @player_hash = {user_name: @user, score: @final_score.to_s}
    @players << Player.new(@player_hash)
  end

  def save
    players_as_hashes = @players.map(&:instance_variables)
    export('highscores.csv', players_as_hashes)
  end

  def changeScore
    @players.each do |player_object|
        if player_does_not_exist
          add_player_to_highscores
          break
        elsif player_object.user_name == @user && player_object.score.to_i <= @final_score
          player_object.instance_variables[:score] = @final_score.to_s && player_object.score = @final_score.to_s
        end
      end
    save
  end

  def player_does_not_exist
    existing_users = []
    @players.each do |player_object|
      existing_users <<  player_object.user_name
    end
      if existing_users.include?(@user)
        false
      else
        true
      end
    end

    def sort_players
      @players = import(@file).map {|player| Player.new player}
      @players.sort { |a, b| b.score <=> a.score }
    end
  end
