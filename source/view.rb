class View
  def self.choose_category
    puts '~*~'*10
    puts 'Welcome to BrainSnap'
    puts
    puts 'Select a category:'
    puts '1. Animals'
    puts '2. Food'
    puts '3. Computers'
    puts '~*~'*10
    puts
  end

  def self.enter_username
    puts '~*~'*10
    puts 'Welcome to BrainSnap'
    puts
    puts "Enter Your \"Username\" to begin!"
    puts '~*~'*10
    puts
  end


  def self.user_input
    gets.chomp
  end

  def self.start_menu
    puts 'Here\'s how it works:'
    puts '------------------------'
    puts 'We\'ll give you question...'
    sleep 2
    puts '...you give us an answer. Pretty standard right?'
    puts 'Type \"quit\" at any time to quit!'
  end

  def self.category_screen(category)
    puts "The Category is #{category}"
  end

  def self.show_card(question)
    puts "#{question}"
    puts
  end

  def self.correct
    responses = ["That's Right", "Great Job Yo", "How did you know that? That shit's crazy.", "You must be a Rock Dove.", "How do you fit such a big brain in such a small head?", "Teach me your ways Kemosabe", "Correct!", "BAM!"]
    puts responses.sample
    puts
  end

  def self.incorrect(correct_answer)
    responses = ["Dang son you need to study...", "Really?", "(incorrect buzzer noise)", "Hahaha nice try.", "Outlook not so good", "Time for a beer I guess, we're in for the long haul"]
    puts responses.sample
    puts "The correct response is: " + correct_answer + ""
    puts
  end

  def self.show_results(num_correct, num_incorrect)
    if num_correct == 0
      puts "Are you even trying?"
    elsif num_incorrect == 0
      puts "Holy $&^% you\'re smart!"
    elsif num_correct > num_incorrect
      puts "Great Work! Keep it up!"
    elsif num_incorrect > num_correct
      puts "You got some work to do."
    end
    puts "Total right: #{num_correct}"
    puts "Total wrong: #{num_incorrect}"
    puts '--------------------------------------'
  end

  def self.clear
    puts "\e[H\e[2J"
  end

  def self.show_scores(players)
    i = 0
    puts "High Scores:"
    # while i == players.length || i <= 10
    players.each { |player| puts "#{player.user_name}: #{player.score}" }
  end
end
# test = View.new
# puts "Correct answers"
# View.correct
# puts "Incorrect answers"
# View.incorrect
