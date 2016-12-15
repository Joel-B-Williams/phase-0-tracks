require 'sqlite3'

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
expenses INTEGER
)'

db.execute(create_table) 

#Method to add new user
def add_user(db, user_name)
add_user = '
	INSERT INTO budgets 
	(name, cache, expected_income, actual_income, expenses)
	VALUES (?,0,0,0,0)'
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
	cache_bonus = difference if difference > 0
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


# DRIVER CODE ish - if statement for new/existing budget
puts "What is your name, humanoid?"
user = gets.chomp
add_user(db, user)
set_expected_income(db, user, 2000)

puts "income/expenses/cache"
puts current_income(db, user)
puts current_expenses(db, user)
puts current_cache(db, user)
puts "income/expenses"
add_to_income(db, user, 500)
add_to_expenses(db, user, 200)
puts current_income(db, user)
puts current_expenses(db, user)
puts "new cache, income/expenses"
puts current_cache(db, user)
puts current_income(db, user)
puts current_expenses(db, user)
monthly_reset(db, user)
puts "Post reset income/expenses/cache"
puts current_income(db, user)
puts current_expenses(db, user)
puts current_cache(db, user)