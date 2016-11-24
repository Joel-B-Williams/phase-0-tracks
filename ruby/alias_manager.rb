def create_alias(first_name, last_name)
	nickname = ""
	first = ""
	last = ""
end

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
			end
				jumbled_name<<vowels[vowels.index(letter)+1]
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

puts jumble("abc")
puts jumble("abcdefg hijklmnop")
puts jumble("Joel Williams")
