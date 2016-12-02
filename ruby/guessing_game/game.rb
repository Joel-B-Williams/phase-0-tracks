# Game class guessing game
# Initialize a new game with the secret word as a variable
# limit the number of guesses -> relate to length of word
# repeated guesses do not count against player (store guesses and compare)
# print feedback after each guess (wheel of fortune style/hangman style)
# display appropriate message at end of game

class Game
	attr_accessor :display, :last_guess
	def initialize
		@guess_count = 0
		@guess = ""
		@guessed_letters = []
		@word_display = ""
	end
	def secret_word(word)
		@secret_word = word
	end

	def more_guesses
		if @guess_count < @secret_word.length*2
			true
		else
			false
		end
	end

	def store_guess(letter) #--argument to be last_guess--
		@guessed_letters << letter
	end
	
	def was_guessed(player_guess)
		@guessed_letters.include? player_guess
	end

	def increase_guess_count(bool) #--argument to be was_guessed--
		@guess_count += 1 if bool == false
		bool	
  end

  def guess(letter)
  	@guess = letter
  end

  def display_blanks
  	@word_display += "_"*@secret_word.length
  end

#break secret word into array (.chars)
#compare each letter to last letter guessed
#if last letter = given index of secret word (array)
#assign letter to corresponding index of display
  def update_display 
  	letters = @secret_word.chars
  	letters.each_with_index {|letter, index| @word_display[index] = letter if letter == @guess}
  	@word_display
  end

  def display_guess_count 
  	p @guess_count
  end

  def display_current_board 
  	p @word_display
  end
end


#### USER INTERFACE ####

# puts "FORSOOTH AND VERILY!!  What word shall your opponent be forced to guess?"
# secret_word = gets.chomp
# puts "SO SHALL IT BE.  Initializing the test of the ancients."
# game = Game.new
# game.secret_word(secret_word)
# puts "Champion of yonder regions, to succeed in all things hitherto-for, you must FILL IN THE BLANKS."
# puts game.display_blanks
# until game.more_guesses != true
# puts "What shall your guess be?"
# #take guess, increase guess_count?
# guess = gets.chomp
# game.last_guess(guess)
# game.increase_guess_count(game.was_guessed(guess))
# game.player_guess(guess) if !game.increase_guess_count(game.was_guessed(guess)) 
# end


