def jumble(name)
	vowels = "aeiou"
	consonants = "bcdfghjklmnpqrstvwxyz"
	jumbled_name = ""
	#for each letter in name (lower), return index+1 to jumbled (watch edges)
	name.downcase.chars.each do |letter|
		jumbled_name<<" " if letter == " "
		if vowels.include?(letter)
			if letter == "u"
				jumbled_name<<"a"
			else
				jumbled_name<<vowels[vowels.index(letter)+1]
			end
		elsif consonants.include?(letter)
			if letter == "z"
				jumbled_name<<"b"
			else
				jumbled_name<<consonants[consonants.index(letter)+1]
			end
		else
			jumbled_name<<letter
		end
	end
	jumbled_name
end

def create_alias(first_name, last_name)
	nickname = jumble(last_name).capitalize
	nickname<<" "
	nickname<<jumble(first_name).capitalize
end

puts "That you agent?"
puts ""
little_black_book = {}
until gets.chomp == "quit"
	puts "What is your last name, agent?"
	agent_last = gets.chomp
	puts "Agent #{agent_last}?  Sheesh, like I haven't heard that one.  First name?"
	agent_first = gets.chomp
	agent_alias = create_alias(agent_first, agent_last)
	puts "You'll get a belly full'a lead in no time flat goin' by a name like that..."
	puts "Tell ya what, you can be #{agent_alias}.  Yeah, that'll do."
	little_black_book[agent_alias]=[agent_first, agent_last]
	puts ""
	puts "Got a friend with you there?  Step on up. ('quit' to exit)"
end

little_black_book.each {|fake, real| puts "Agent #{real[0]} #{real[1]} is going by the name of #{fake}."}
