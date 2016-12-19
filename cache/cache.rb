require 'sqlite3'
require 'date'

#create database
db = SQLite3::Database.new("cache.db")

#create table if not already existant

create_tables = '
CREATE TABLE IF NOT EXISTS users(
id INTEGER PRIMARY KEY,
name TEXT,
cache INTEGER,
expected_income INTEGER,
actual_income INTEGER,
expenses INTEGER,
month INTEGER
);

CREATE TABLE IF NOT EXISTS categories(
id INTEGER PRIMARY KEY,
name VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS expenses(
id INTEGER PRIMARY KEY,
user_id INTEGER REFERENCES users(id),
category_id INTEGER REFERENCES categories(id),
amount INTEGER
)'

db.execute_batch(create_tables) 

#Method to add new user
def add_user(db, user_name)
add_user = '

	INSERT INTO users 

	(name, cache, expected_income, actual_income, expenses, month)
	VALUES (?,0,0,0,0,1)'
	db.execute(add_user, [user_name]) 
end

# Method to retrieve current categories
def current_categories(db)
	retrieve_categories = '
	SELECT name FROM categories'
	categories = db.execute(retrieve_categories)
end

# Method to display categories
def display_categories(db)
	current_categories(db).each_with_index {|category, index| puts "#{(index +1)}: #{category[0]}"}
end

# Method to add category
def add_category(db, category)
	new_category = '
	INSERT INTO categories (name)
	VALUES (?)'
	db.execute(new_category, [category])
end


# --methods to retreive and manipulate table data--
# method to set expected income 
def set_expected_income(db, user_name, dolla_dolla_bills_yall)
	expected_income = '

	UPDATE users SET expected_income = ?

	WHERE name = ?' 
	db.execute(expected_income, [dolla_dolla_bills_yall, user_name]) 
end

# method to retrieve expected income
def expected_income(db, user_name)
	retrieve_expected_income = '

	SELECT expected_income FROM users

	WHERE name = ?'
	expected_income = db.execute(retrieve_expected_income, [user_name])[0][0]
end

# method to check current actual income
def current_income(db, user_name)	
	retrieve_income = '

	SELECT actual_income FROM users

	WHERE name = ?'
	income = db.execute(retrieve_income, [user_name])[0][0]
end

# method to add to actual income
def add_to_income(db, user_name, dolla_dolla_bills_yall)
	new_income_total = (dolla_dolla_bills_yall.to_i + current_income(db, user_name))
	change_income = '
	UPDATE users 

	SET actual_income = ?
	WHERE name = ?'
	db.execute(change_income, [new_income_total, user_name])
end

# method to check current expenses
def current_expenses(db, user_name)
	retrieve_expenses = '

	SELECT expenses FROM users

	WHERE name = ?'
	expenses = db.execute(retrieve_expenses, [user_name])[0][0]
end

# method to add to expenses
def add_to_expenses(db, user_name, dolla_dolla_bills_yall)
	new_expenses_total = (dolla_dolla_bills_yall.to_i + current_expenses(db, user_name))
	change_expenses = '

	UPDATE users

	SET expenses = ?
	WHERE name = ?'
	db.execute(change_expenses, [new_expenses_total, user_name])
end


# Method to categorize expenses
def categorize_expense(db, user_id, category_id, dolla_dolla_bills_yall)
	categorize = '
	INSERT INTO expenses (user_id, category_id, amount)
	VALUES (?, ?, ?)'
	db.execute(categorize, [user_id, category_id, dolla_dolla_bills_yall])
end

# Method to display sorted monthly expenses
def current_categorized_expenses(db, user_name)
	retrieve_categorized_expenses = '
	SELECT categories.name, amount FROM expenses
	JOIN users ON expenses.user_id = users.id
	JOIN categories ON expenses.category_id = categories.id
	WHERE users.name = ?'
	categorized_expenses = db.execute(retrieve_categorized_expenses, [user_name])
end

# Method to return user id
def return_id(db, user_name)
	retrieve_id = '
	SELECT id FROM users
	WHERE name = ?'
	id = db.execute(retrieve_id, [user_name])
end

# method to categorize expenses
def category_totals(db, user_name, number)
	retrieve_totals = '
	SELECT categories.name, SUM(amount) FROM expenses
	JOIN users ON expenses.user_id = users.id
	JOIN categories ON expenses.category_id = categories.id
	WHERE categories.id = ?
	AND users.name = ?'
	totals = db.execute(retrieve_totals, [number, user_name])[0]
end

# method to check current cache
def current_cache(db, user_name)
	retrieve_cache = '
	SELECT cache FROM users

	WHERE name = ?'
	cache = db.execute(retrieve_cache, [user_name])[0][0]
end

# method to determine excess money to move to cache
def extra_cash(db, user_name)
	# determine extra monies (conditional on + amount)
	difference = (current_income(db, user_name) - current_expenses(db, user_name))
	cache_bonus = difference if difference > 0 || 0
end

# method to add ^^ bonus ^^ to current cache
def add_to_cache(db, user_name)
	cache_bonus = (current_cache(db, user_name) + extra_cash(db, user_name))
	add_bonus = '

	UPDATE users 

	SET cache = ?
	WHERE name = ?'
	db.execute(add_bonus, [cache_bonus, user_name])
end

# method to pull from cache
def pull_from_cache(db, user_name, dolla_dolla_bills_yall)
	#set cache = current value - arg, then add arg to income()
	new_cache = (current_cache(db, user_name) - dolla_dolla_bills_yall.to_i)
	update_cache = '

	UPDATE users 

	SET cache = ?
	WHERE name = ?'
	db.execute(update_cache, [new_cache, user_name])
end

# method to reset actual income
def reset_actual_income(db, user_name)
	reset = '
	UPDATE users
	SET actual_income = 0
	WHERE name = ?'
	db.execute(reset, [user_name])
end

# method to reset expenses
def reset_expenses(db, user_name)
	reset = '

	UPDATE users
	SET expenses = 0
	WHERE name = ?;

	DELETE FROM expenses
	WHERE user_id = ?'

	db.execute_batch(reset, [user_name, return_id(db, user_name)])
end

# method to reset row/add to cache

def monthly_reset(db, user_name)
 add_to_cache(db, user_name)
 reset_actual_income(db, user_name)
 reset_expenses(db, user_name)
end

# method to print command options
def display_options(list)
	puts "Please select an option (by number):"
	list.each_with_index {|command, index| puts "#{index+1}. #{command}"}
	puts "Enter 'q' to quit"
end

# method to check month column
def check_month(db, user_name)
	stored_month = '

	SELECT month FROM users

	WHERE name = ?'
	month = db.execute(stored_month, [user_name])[0][0]
end

# method to change month column
def change_month(db, user_name)
	dec_to_jan = '

	UPDATE users SET month = 1
	WHERE name = ?'
	next_month = '
	UPDATE users SET month = ?

	WHERE name = ?'
	if check_month(db, user_name) == 12
		db.execute(dec_to_jan, [user_name])
	else 
		db.execute(next_month, [(check_month(db,user_name)+1), user_name])
	end
	check_month(db, user_name)
end



# # DRIVER CODE ish 

puts "What is your name, humanoid?"
user = gets.chomp
puts "Do you already have an active account? (y/n)"
active_account = gets.chomp

add_user(db, user) if active_account[0].downcase == "n"

# check month - add to month-column if not equal 
while check_month(db, user) != Date.today.month
	monthly_reset(db, user)
	change_month(db, user)
end

commands = ["Set expected income", 
						"Add income", 
						"Add expense",
						"Pull from cache", 
						"View cache", 
						"View income", 
						"View expenses", 
						"View summary",
						"View/Add categories"]
puts "\n"
display_options(commands)
option = gets.chomp
puts "\n"

until option == "q"

	while option.to_i > commands.length
		display_options(commands)
		option = gets.chomp
	end

	case option
	when "1" 
		puts "Please enter expected income:"
		dollar_amount = gets.chomp
		set_expected_income(db, user, dollar_amount)
	when "2"
		puts "Please enter income amount:"
		dollar_amount = gets.chomp
		add_to_income(db, user, dollar_amount)
	when "3"
		puts "Please enter expense amount:"
		dollar_amount = gets.chomp
		add_to_expenses(db, user, dollar_amount)
		puts "Would you like to categorize this expense? (y/n)"
		categorize = gets.chomp
		if categorize[0].downcase == "y"
			puts "Please choose a category. (by number)"
			display_categories(db)
			cat_id = gets.chomp
			categorize_expense(db, return_id(db, user), cat_id, dollar_amount)
		end

	when "4"
		puts "How much would you like to pull from your cache?"
		dollar_amount = gets.chomp.to_i
		if dollar_amount > current_cache(db, user)
			puts "I'm sorry, you do not have that much in your cache."
		else
			#method to pull from cache, followed by add_to_income
			pull_from_cache(db, user, dollar_amount)
			add_to_income(db, user, dollar_amount)
		end
	when "5"
		puts "Current Cache: $#{current_cache(db, user)}"
	when "6"
		puts "Current Monthly Income: $#{current_income(db, user)}"
	when "7"
		puts "Current Monthly Expenses: $#{current_expenses(db, user)}"
		#++SUPER GROSS BUT I"M TIRED++
		category_count = db.execute('SELECT COUNT(*) FROM categories')[0][0]
		i = 1
		category_count.times do
			puts "#{category_totals(db, user, i)[0]}: $#{category_totals(db, user, i)[1]}" if category_totals(db, user, i)[0] != nil
			i += 1
		end
	when "8"
		puts "Current Expected income: $#{expected_income(db, user)}"
		puts "Current Monthly Income: $#{current_income(db, user)}"
		puts "Current Monthly Expenses: $#{current_expenses(db, user)}"
		puts "Current Cache: $#{current_cache(db, user)}"
	when "9"
		display_categories(db)
		puts "Please enter the name of the category you would like to add. ('q' to quit)"
		category = gets.chomp
		until category == "q"
			add_category(db, category)
			puts "Category #{category} added.  Add another, or 'q' to quit."
			category = gets.chomp
		end
r
	end
	puts "\n"
	display_options(commands)
	option = gets.chomp
	puts "\n"
end

puts "Thank you for using Cache!"
