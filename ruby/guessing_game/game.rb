# Game class guessing game
# Initialize a new game with the secret word as a variable
# limit the number of guesses -> relate to length of word
# repeated guesses do not count against player (store guesses and compare)
# print feedback after each guess (wheel of fortune style/hangman style)
# display appropriate message at end of game

class Game
	def initialize
		@guess_count = 0
		@last_guess = ""
		@guessed_letters = []
		@display = ""
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

	def player_guess(letter) #--argument to be last_guess--
		@guessed_letters<<letter
	end
	
	def was_guessed(player_guess)
		@guessed_letters.include? player_guess
	end

	def increase_guess_count(bool) #--argument to be was_guessed--
		@guess_count += 1 if bool == false
		bool	
  end

  def last_guess(letter)
  	@last_guess = letter
  end

  def display_blanks
  	@display += "_"*@secret_word.length
  end

#break secret word into array (.chars)
#compare each letter to last letter guessed
#if last letter = given index of secret word (array)
#assign letter to corresponding index of display
  def update_display 
  	letters = @secret_word.chars
  	letters.each_with_index do |letter, index|
  		if letter == @last_guess
  			@display[index] = @last_guess
  		end
  	end
  end

end
