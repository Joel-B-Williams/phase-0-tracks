# Game class guessing game
# Initialize a new game with the secret word as a variable
# limit the number of guesses -> relate to length of word
# repeated guesses do not count against player (store guesses and compare)
# print feedback after each guess (wheel of fortune style/hangman style)
# display appropriate message at end of game

class Game
	def initialize
		@guess_count = 0
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
end