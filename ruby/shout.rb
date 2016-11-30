module Shout
	#Standalone Shout module methods
	# def self.yell_angrily(words)
	# 	words+"!!!"+":C"
	# end

	# def self.yell_happily(words)
	# 	words+"!!!"+"C:"
	# end
	def yell_angrily(words)
		puts words+"!!!"+":C"
	end

	def yell_happily(words)
		puts words+"!!!"+"C:"
	end
end

# puts Shout.yell_happily("I can't believe you did this")
# puts Shout.yell_angrily("I can't believe you did this")
# puts "You see?  The faces make all the difference!"
class Parent
	include Shout	
end

class Teacher
	include Shout
end

parent = Parent.new
parent.yell_angrily("You did this")
parent.yell_happily("You did this")

teacher = Teacher.new
teacher.yell_happily("You did this")
teacher.yell_angrily("You did this")
