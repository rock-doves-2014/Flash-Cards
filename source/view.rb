class View
  def self.welcome
    puts '~*~'*10
    puts 'Welcome to BrainSnap'
    puts
    puts "\"Start\" to begin!"
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
  end

  def self.correct
    responses = ["That's Right", "Great Job Yo", "How did you know that? That shit's crazy.", "You must be a Rock Dove.", "How do you fit such a big brain in such a small head?", "Teach me your ways Kemosabe", "Correct!", "BAM!"]
    puts responses.sample
  end

  def self.incorrect(correct_answer)
    responses = ["Dang son you need to study...", "Really?", "(incorrect buzzer noise)", "Hahaha nice try.", "Outlook not so good", "Time for a beer I guess, we're in for the long haul"]
    puts responses.sample
    puts "The correct response is:" + correct_answer + ""
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
    puts "You got #{num_correct} right!"
    puts "You got #{num_incorrect} wrong!"
    puts '--------------------------------------'
  end

  def self.clear
    puts "\e[H\e[2J"
  end
end
# test = View.new
# puts "Correct answers"
# View.correct
# puts "Incorrect answers"
# View.incorrect
