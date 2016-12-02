# Game class guessing game
# Initialize a new game with the secret word as a variable
# limit the number of guesses -> relate to length of word
# repeated guesses do not count against player (store guesses and compare)
# print feedback after each guess (wheel of fortune style/hangman style)
# display appropriate message at end of game

class Game
	attr_reader :guess_count, :word_display
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
	  @guess_count < @secret_word.length*2
	end

	def store_guess(letter) #--argument to be last_guess--
		@guessed_letters << letter
	end
	
	def was_guessed(player_guess)
		@guessed_letters.include? player_guess
	end

	def increase_guess_count(bool) #--argument to be was_guessed--
		@guess_count += 1 if bool == false
		!bool	
  end

  def guess=(letter)
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

  # def display_guess_count
  # 	@guess_count
  # end

  # def display_current_board
  # 	@word_display
  # end
end


#### USER INTERFACE ####

puts "FORSOOTH AND VERILY!!  What word shall your opponent be forced to guess?"
secret_word = gets.chomp
puts "\n"*50
puts "SO SHALL IT BE.  Initializing the test of the ancients."
game = Game.new
game.secret_word(secret_word)
puts "Champion of yonder regions, to succeed in all things hitherto-for, you must FILL IN THE BLANKS."
puts game.display_blanks

#loop logic...
#while the player has more guesses
#ask player for a guess
#check if guess is a repeat (specialty responce for repeat?)
#if not repeat, update counter and add to guessed letters
#update the display
#display guess count and word board
#if display ever equals secret word (ie, fully guessed) display good message
#if out of guesses and failure, mock the poop out of player
while game.more_guesses
  puts "What shall be thine guess???"
  guess = gets.chomp
  game.guess=(guess)
  game.store_guess(guess) if game.increase_guess_count(game.was_guessed(guess))#logic = bool forest
  game.update_display
  puts "Guess Count: #{game.guess_count}"
  puts "Current Board: #{game.word_display}"
  if game.word_display == secret_word
    puts "Lo and behold, a champion has arisen!!  HUZZAH!! HUZZAH!! HUZZAH!!"
    break
  end
end

#failure message here - if secret word != display board after guesses used
puts "ALAS!! BETRAYAL AND HERESY!!! Curse you and your progeny's progeny!!" if game.word_display != secret_word








