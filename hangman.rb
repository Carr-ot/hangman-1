class Hangman
    def initialize(word)
      # Initialize the game with a word, convert it to lowercase
      @word = word.downcase
      # Store guessed letters
      @guessed_letters = []
      # Set the maximum allowed incorrect attempts
      @max_attempts = 6
      # Initialize the current attempts counter
      @current_attempts = 0
    end
  
    def display_word
      # Display the word with guessed letters and underscores for unguessed ones
      display = ''
      @word.each_char do |char|
        display += @guessed_letters.include?(char) ? char : '_'
      end
      display
    end
  
    def make_guess(letter)
      letter = letter.downcase
  
      if @guessed_letters.include?(letter)
        # Check if the letter has already been guessed
        puts "You already guessed '#{letter}'. Try again."
        return
      end
  
      @guessed_letters << letter
  
      unless @word.include?(letter)
        # Increase the number of incorrect attempts if the guessed letter is not a part of the word
        @current_attempts += 1
        puts "Incorrect guess. Attempts left: #{@max_attempts - @current_attempts}"
      end
    end
  
    def game_over?
      # Check if the game is over, either due to reaching max attempts or guessing the word
      @current_attempts >= @max_attempts || word_guessed?
    end
  
    def word_guessed?
      # Check if the word has been completely guessed
      display_word == @word
    end
  end
  
  def play_hangman
    # Add words yourself, examples are there, just replace a word
    words = ["ruby", "coding", "visualstudio", "computer", "code"]
  
    # Initialize Hangman with a randomly selected word
    hangman = Hangman.new(words.sample)
  
    puts "Welcome to Hangman!"
    puts "Try to guess the word."
  
    until hangman.game_over?
      puts "\nWord: #{hangman.display_word}"
      print "Enter a letter: "
      guess = gets.chomp
  
      # Make a guess and displays results based upon win/loss
      hangman.make_guess(guess)
  
      if hangman.word_guessed?
        puts "\nCongratulations! You guessed the word: #{hangman.display_word}"
      elsif hangman.game_over?
        puts "\nGame over! The word was: #{hangman.instance_variable_get(:@word)}"
      end
    end
  end
  
  # Start the Hangman game
  play_hangman
  