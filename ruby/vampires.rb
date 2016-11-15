puts "How many employees will be processed today?"
new_employees = gets.chomp.to_i

def interview
	puts "What is your name?"
	emp_name = gets.chomp
	puts "How old are you?"
	age = gets.chomp
	puts "What year were you born?"
	birth_year = gets.chomp
	puts "Would you like some garlic bread?"
	likes_garlic = gets[0] == "y"
	puts "Do you want health insurance?"
	wants_insurance = gets[0] == "y"

	is_vampire = nil
	age_right = (2016 - age.to_i) == birth_year.to_i

	if age_right && (likes_garlic || wants_insurance)
		is_vampire = "Probably not a vampire."
	end
	if !age_right && (!likes_garlic || !wants_insurance)
		is_vampire = "Probably a vampire."
	end
	if (!age_right && (!likes_garlic && !wants_insurance))
		is_vampire = "Almost certainly a vampire."
	end
	if emp_name == "Tu Fang"
		is_vampire = "Definitely a vampire."
	end
	if emp_name == "Drake Cula"
		is_vampire = "Definitely a vampire."
	end
	if is_vampire == nil
		is_vampire = "Results inconclusive."
	end

	puts is_vampire

end

for i in 0...new_employees
	interview 
end