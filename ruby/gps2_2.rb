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
	individual_item = items.split(" ")
	individual_item.each {|item| grocery_list[item] = 1}
	puts grocery_list #replace with method for fancy printing
	grocery_list
end

def add_item(list, item, quantity)
	list[item] = quantity
	puts list #replace with method for fancy printing
end

def remove_item(list, item)
	list.delete(item)
	puts list #replace with method for fancy printing
end

def change_quantity(list, item, quantity)
	list[item] = quantity
	puts list #replace with method for fancy printing
end

def print_nicely(new_list)
	new_list.each {|item, quantity| puts "Buy #{quantity} #{item}."}
end

my_list = create_list("carrots apples cereal pizza")
add_item(my_list, "Lemonade", 2)
add_item(my_list, "Tomatoes", 3)
add_item(my_list, "Onions", 1)
add_item(my_list, "Ice Cream", 4)
remove_item(my_list, "Lemonade")
change_quantity(my_list, "Ice Cream", 1)
print_nicely(my_list)