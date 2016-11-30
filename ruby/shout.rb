module Shout
	def self.yell_angrily(words)
		words+"!!!"+":C"
	end

	def self.yell_happily(words)
		words+"!!!"+"C:"
	end
end

puts Shout.yell_happily("I can't believe you did this")
puts Shout.yell_angrily("I can't believe you did this")
puts "You see?  The faces make all the difference!"