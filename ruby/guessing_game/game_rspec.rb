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
end
