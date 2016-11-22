def print_line
	puts "This is our printed line."
	yield("awesome")
	yield("super awesome")
	yield("the awesomest")
end

print_line {|description|puts "Our line is #{description}!"}


numbers = [1,2,3,4,5,6,7,8,9]
pets = {
	Levon: "cat",
	Bubbles: "fish",
	Fred: "dog",
	Speckles: "hamster"
}

#numbers each
numbers.each {|num| puts num*2}
puts numbers 

#numbers map
numbers.map {|num| puts num*3}
puts numbers 

#numbers map!
numbers.map! {|num| p num + 1} #using p so as not to return nil values
puts numbers 

#pets each
pets.each {|name, animal| puts "Meet #{name}, my #{animal}."}
puts pets

#numbers delete
numbers.delete_if {|number| number < 5}
puts numbers

#pets delete
pets.delete_if {|name, animal| animal.length > 3}
p pets

#numbers select
numbers.select! {|number| number > 6}
puts numbers

#pets select
pets.select! {|name, animal| name.length > 4}
puts pets


#numbers keep if 
numbers.keep_if {|number| number < 9}
puts numbers

#pets Keep if
pets.keep_if {|name, animal| animal == "cat"}
puts pets


#Take while
small_arrays = []
small_arrays = numbers.take_while {|number| number < 8}
puts small_arrays

#pets reject
pets.reject! {|name, animal| animal == "cat"}
p pets
