class Santa
	
	def speak
		puts "Ho, ho ho! Haaaaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		puts "That was a good #{coookie}!"
	end

	def initialize(gender, ethnicity)
		puts "Initializing Santa instance..."
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
		
	end

	def describe_santa
		puts "Gender: #{@gender}"
		puts "Ethnicity: #{@ethnicity}"
		puts "_"*10
	end

	def celebrate_birthday
		@age += 1
	end

	def get_mad_at(reindeer)
		@reindeer_ranking.delete(reindeer)
		@reindeer_ranking<<(reindeer)
		puts @reindeer_ranking
	end

	def gender=(gender)
		@gender = gender
	end

	def age
		@age 
	end

	def ethnicity
		@ethnicity
	end

end

santas = []
santa_genders = ["male", "female", "unisex", "bicorn", "waffle"]
santa_ethnicities= ["plutonian", "troll", "pirate (carribean)", "Afro-Samurai", "dragons"]

santa_genders.length.times do |santa|
	santas<<Santa.new(santa_genders[santa], santa_ethnicities[santa])
end

santas.each {|santa| santa.describe_santa}

santas[0].get_mad_at("Dasher")
santas[0].gender=("amorphous")
santas[1].celebrate_birthday
puts santas[0].age
puts santas[1].age

santas.each {|santa| santa.describe_santa}
