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

puts create_alias("Joel","Williams")