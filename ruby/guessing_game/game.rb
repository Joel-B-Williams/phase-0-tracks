# Game class guessing game
# Initialize a new game with the secret word as a variable
# limit the number of guesses -> relate to length of word
# repeated guesses do not count against player (store guesses and compare)
# print feedback after each guess (wheel of fortune style/hangman style)
# display appropriate message at end of game

class Game
	def initialize
		@guess_count = 0
		@guessed_letters = []
	end
	def secret_word(word)
		@secret_word = word
	end

	def more_guesses
		@secret_word = "horse"
		if @guess_count < @secret_word.length*2
			true
		else
			false
		end
	end
#test method for rspec reasons <- adjust to add player guesses to array later?
	def change_guessed_letters(new_array)
		@guessed_letters = new_array
	end
	
	def was_guessed(player_guess)
		@guessed_letters.include? player_guess
	end

	def increase_guess_count(bool) #--argument to be was_guessed--
		@guess_count += 1 if bool == false
		bool	
  end

end
