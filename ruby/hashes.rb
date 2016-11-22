#gather client information 

puts "What is the client's name?"
name = gets.chomp
puts "What is the client's age?"
age = gets.chomp.to_s
puts 'How many children does the client have?'
kids = gets.chomp.to_s
puts "What is the clients decor theme?"
theme = gets.chomp
puts "Is the client a terrible person?(y/n)"
evil = gets.chomp
evil = evil == "y"

#use gathered info to create hash

client = {
name: name,
age: age,
kids: kids,
theme: theme,
is_evil: evil
}

puts client

#Ask about change, unless "none" reassign given key to given value

puts "What value would you like to adjust?"
change = gets.chomp
unless change == "none"
	puts "What is the new value?"
	new_value = gets.chomp
	client[change.to_sym]=new_value
	puts client
end
