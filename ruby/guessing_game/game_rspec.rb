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
end
