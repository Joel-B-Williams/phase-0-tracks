def interview
	puts "What is your name?"
	name = gets.chomp
	puts "How old are you?"
	age = gets.chomp
	puts "What year were you born?"
	birth_year = gets.chomp
	puts "Would you like some garlic bread?"
	likes_garlic = gets[0] == "y"||"Y"
	puts "Do you want health insurance?"
	wants_insurance = gets[0] == "y"||"Y"

	is_vampire = nil
	age_right = (2016 - age.to_i) == birth_year.to_i

	if age_right && (likes_garlic || wants_insurance)
		is_vampire = "Probably not a vampire."
	elsif !age_right && (!likes_garlic || !wants_insurance)
		is_vampire = "Probably a vampire."
	
	elsif !age_right && !likes_garlic && !wants_insurance
		is_vampire = "Almost certainly a vampire."
	
	elsif name = "Drake Cula" || "Tu Fang"
		is_vampire = "Definitely a vampire."
	else
		puts "Results inconclusive."
	end

	puts is_vampire
	
end

