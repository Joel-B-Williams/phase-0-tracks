#RPsec
#'describe' block for each group of tests
	#'it' block for each individual test
		#expect(CODE HERE).to eq <RESULT>

require_relative 'game'

describe Game do
	let(:game) {Game.new}
	it "establishes secret word" do
		expect(game.secret_word("word")).to eq "word"
	end

	it "checks number of guesses" do
		game.secret_word("horse")
		expect(game.more_guesses). to eq true
	end

	it "checks if letter has been guessed" do
		game.store_guess(game.guess("d"))
		expect(game.was_guessed("d")). to eq true
	end

	it "DOES NOT increase guess count if letter already guessed" do #if 'was-guessed' = true
		game.store_guess(game.guess("a"))
		expect(game.increase_guess_count(game.was_guessed("a"))). to eq true
	end

	it "DOES increase guess count if letter NOT already guessed" do
		game.store_guess(game.guess("a"))
		expect(game.increase_guess_count(game.was_guessed("r"))). to eq false
	end

	it "displays blank spaces in place of initial secret word " do
		game.secret_word("panda")
		expect(game.display_blanks). to eq "_____"
	end

	it "updates display when correct letters guessed" do
		game.secret_word("panda")
		game.display_blanks
		game.guess("a")
		expect(game.update_display). to eq "_a__a"
	end

	it "displays current guess count" do
		game.guess("a")
		game.increase_guess_count(game.was_guessed("a"))
		expect(game.display_guess_count). to eq 1
	end

	it "displays current word display" do
		game.secret_word("panda")
		game.display_blanks
		game.guess("a")
		game.update_display
		expect(game.display_current_board). to eq "_a__a"
	end
end
