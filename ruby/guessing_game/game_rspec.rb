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
		expect(game.more_guesses). to eq true
	end

	it "checks if letter has been guessed" do
		game.change_guessed_letters(["a", "c", "s", "p"])
		expect(game.was_guessed("d")). to eq false
	end

	it "DOES NOT increase guess count if letter already guessed" do #if 'was-guessed' = true
		game.change_guessed_letters(["a", "c", "s", "p"])
		expect(game.increase_guess_count(game.was_guessed("a"))). to eq true
	end

	it "DOES increase guess count if letter NOT already guessed" do
		game.change_guessed_letters(["a", "c", "s", "p"])
		expect(game.increase_guess_count(game.was_guessed("r"))). to eq false
	end
end
