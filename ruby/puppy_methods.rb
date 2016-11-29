class Puppy

 def initialize
  puts "I'm a dog, bark!"
 end

 def play_dead  
   puts "...."
 end

 def speak(barking)
   barking.times {puts "Woof!"}
 end

 def dog_years(human_years)
   dog_years = human_years * 7
 end  
 
 def roll_over
   puts "*rolls over*"
 end  
 
 def fetch(toy)
   puts "I brought back the #{toy}!"
   # toy
 end
end

sir_paddington = Puppy.new
rover = Puppy.new

sir_paddington.fetch("ball")

sir_paddington.speak(5)

sir_paddington.roll_over

sir_paddington.play_dead

puts "our dog is really #{sir_paddington.dog_years(2)}."

array_of_cats = []
class Cat
	
	def initialize
		puts "I'm a new cat!"
	end
	
	def cat_nap(hours)
		puts "I napped for #{hours} hours."
	end
	
	def stalk_bird(amount)
		puts "I stalked #{amount} birds today."
	end

end

50.times {array_of_cats<<Cat.new} #create 50 identical cats
# puts array_of_cats <- outputs unique identifiers
array_of_cats.each do |cat|
	cat.cat_nap(2)
	cat.stalk_bird(3)
end
