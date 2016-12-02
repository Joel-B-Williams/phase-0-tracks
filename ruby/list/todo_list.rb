class TodoList

	def initialize(chores)
		@chores = chores
	end

	def get_items
		p @chores
	end

	def add_item(chore)
		@chores << chore
	end
end