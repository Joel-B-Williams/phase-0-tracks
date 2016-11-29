# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # break into individual items
  # add each item to hash
  # set default quantity
  # print the list to the console [can you use one of your other methods here?]
# output: Hash

# Method to add an item to a list
# input: item name and optional quantity
# steps: add item with optional quantity
# output: updated Hash

# Method to remove an item from the list
# input: key to remove using appropriate method
# steps: use deletion method
# output: updated hash

# Method to update the quantity of an item
# input: appropriate item and quantity
# steps: input item and reset quantity
# output: updated hash

# Method to print a list and make it look pretty
# input: grocery list name
# steps: print out items/quantities in legible form
# output: items with quantities


def create_list(items)
	grocery_list = {}
	each_item = items.split(" ")
	each_item.each {|item| grocery_list[item] = 1}
	puts grocery_list #replace with method for fancy printing
end

def add_item(item, quantity)
	grocery_list[item]=quantity
	puts grocery_list #replace with method for fancy printing
end

def remove_item(item)
	grocery_list.delete(item)
	puts grocery_list #replace with method for fancy printing
end

def change_quantity(item, quantity)
	grocery_list[item]=quantity
	puts grocery_list #replace with method for fancy printing
end

def print_nicely(grocery-list)
	grocery_list.each {|item, quantity| puts "Buy #{quantity} #{item}(s)."}
end
