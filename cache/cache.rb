require 'sqlite3'
require 'date'

#create database
db = SQLite3::Database.new("cache.db")

#create table if not already existant
create_table = '
CREATE TABLE IF NOT EXISTS budgets(
id INTEGER PRIMARY KEY,
name TEXT,
cache INTEGER,
expected_income INTEGER,
actual_income INTEGER,
expenses INTEGER,
month INTEGER
)'

db.execute(create_table) 

#Method to add new user
def add_user(db, user_name)
add_user = '
	INSERT INTO budgets 
	(name, cache, expected_income, actual_income, expenses, month)
	VALUES (?,0,0,0,0,1)'
	db.execute(add_user, [user_name]) 
end

# --methods to retreive and manipulate table data--
# method to set expected income 
def set_expected_income(db, user_name, dolla_dolla_bills_yall)
	expected_income = '
	UPDATE budgets SET expected_income = ?
	WHERE name = ?' 
	db.execute(expected_income, [dolla_dolla_bills_yall, user_name]) 
end

# method to retrieve expected income
def expected_income(db, user_name)
	retrieve_expected_income = '
	SELECT expected_income FROM budgets
	WHERE name = ?'
	expected_income = db.execute(retrieve_expected_income, [user_name])
end

# method to check current actual income
def current_income(db, user_name)	
	retrieve_income = '
	SELECT actual_income FROM budgets
	WHERE name = ?'
	income = db.execute(retrieve_income, [user_name])
end

# method to add to actual income
def add_to_income(db, user_name, dolla_dolla_bills_yall)
	new_income_total = (dolla_dolla_bills_yall + current_income(db, user_name)[0][0])
	change_income = '
	UPDATE budgets 
	SET actual_income = ?
	WHERE name = ?'
	db.execute(change_income, [new_income_total, user_name])
end

# method to check current expenses
def current_expenses(db, user_name)
	retrieve_expenses = '
	SELECT expenses FROM budgets
	WHERE name = ?'
	expenses = db.execute(retrieve_expenses, [user_name])
end

# method to add to expenses
def add_to_expenses(db, user_name, dolla_dolla_bills_yall)
	new_expenses_total = (dolla_dolla_bills_yall + current_expenses(db, user_name)[0][0])
	change_expenses = '
	UPDATE budgets
	SET expenses = ?
	WHERE name = ?'
	db.execute(change_expenses, [new_expenses_total, user_name])
end

# method to check current cache
def current_cache(db, user_name)
	retrieve_cache = '
	SELECT cache FROM budgets
	WHERE name = ?'
	cache = db.execute(retrieve_cache, [user_name])
end

# method to determine excess money to move to cache
def extra_cash(db, user_name)
	# determine extra monies (conditional on + amount)
	difference = (current_income(db, user_name)[0][0] - current_expenses(db, user_name)[0][0])
	cache_bonus = difference if difference > 0 || 0
end

# method to add ^^ bonus ^^ to current cache
def add_to_cache(db, user_name)
	cache_bonus = (current_cache(db, user_name)[0][0] + extra_cash(db, user_name))
	add_bonus = '
	UPDATE budgets 
	SET cache = ?
	WHERE name = ?'
	db.execute(add_bonus, [cache_bonus, user_name])
end

# method to pull from cache
def pull_from_cache(db, user_name, dolla_dolla_bills_yall)
	#set cache = current value - arg, then add arg to income()
	new_cache = (current_cache(db, user_name)[0][0] - dolla_dolla_bills_yall)
	update_cache = '
	UPDATE budgets 
	SET cache = ?
	WHERE name = ?'
	db.execute(update_cache, [new_cache, user_name])
end

# method to reset actual income
def reset_actual_income(db, user_name)
	reset = '
	UPDATE budgets
	SET actual_income = 0
	WHERE name = ?'
	db.execute(reset, [user_name])
end

# method to reset expenses
def reset_expenses(db, user_name)
	reset = '
	UPDATE budgets
	SET expenses = 0
	WHERE name = ?'
	db.execute(reset, [user_name])
end

# method to reset row/add to cache(?) -> time module?
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
	SELECT month FROM budgets
	WHERE name = ?'
	month = db.execute(stored_month, [user_name])
end

# method to change month column
def change_month(db, user_name)
	dec_to_jan = '
	UPDATE budgets SET month = 1
	WHERE name = ?'
	next_month = '
	UPDATE budgets SET month = ?
	WHERE name = ?'
	if check_month(db, user_name)[0][0] == 12
		db.execute(dec_to_jan, [user_name])
	else 
		db.execute(next_month, [(check_month(db,user_name)[0][0]+1), user_name])
	end
	check_month(db, user_name)
end


# DRIVER CODE ish 
puts "What is your name, humanoid?"
user = gets.chomp
puts "Do you already have an active account? (y/n)"
active_account = gets.chomp

add_user(db, user) if active_account[0].downcase == "n"

# check month - add to month-column if not equal 
while check_month(db, user)[0][0] != Date.today.month
	monthly_reset(db, user)
	change_month(db, user)
end

commands = ["Set expected income", 
						"Add income", 
						"Add expense",
						"Pull from cache" 
						"View cache", 
						"View income", 
						"View expenses", 
						"View all"]
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
	when "4"
		puts "How much would you like to pull from your cache?"
		dollar_amount = gets.chomp
		if dollar_amount > current_cache(db, user)[0][0]
			puts "I'm sorry, you do not have that much in your cache."
		else
			#method to pull from cache, followed by add_to_income
			pull_from_cache(db, user, dollar_amount)
			add_to_income(db, user, dollar_amount)
		end
	when "5"
		puts "Current Cache: $#{current_cache(db, user)[0][0]}"
	when "6"
		puts "Current Monthly Income: $#{current_income(db, user)[0][0]}"
	when "7"
		puts "Current Monthly Expenses: $#{current_expenses(db, user)[0][0]}"
	when "8"
		puts "Current Expected income: $#{expected_income(db, user)[0][0]}"
		puts "Current Monthly Income: $#{current_income(db, user)[0][0]}"
		puts "Current Monthly Expenses: $#{current_expenses(db, user)[0][0]}"
		puts "Current Cache: $#{current_cache(db, user)[0][0]}"
	end
	puts "\n"
	display_options(commands)
	option = gets.chomp
	puts "\n"
end

puts "Thank you for using Cache!"
# set_expected_income(db, user, 2000)

# puts "income/expenses/cache"
# puts current_income(db, user)
# puts current_expenses(db, user)
# puts current_cache(db, user)
# puts "income/expenses"
# add_to_income(db, user, 500)
# add_to_expenses(db, user, 200)
# puts current_income(db, user)
# puts current_expenses(db, user)
# puts "new cache, income/expenses"
# puts current_cache(db, user)
# puts current_income(db, user)
# puts current_expenses(db, user)
# monthly_reset(db, user)
# puts "Post reset income/expenses/cache"
# puts current_income(db, user)
# puts current_expenses(db, user)
# puts current_cache(db, user)