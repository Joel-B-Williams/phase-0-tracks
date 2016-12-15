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
	add_income = '
	'
end
# method to add to expenses
# method to reset row/add to cache(?) -> time module?

# DRIVER CODE ish - if statement for new/existing budget
# puts "What is your name, humanoid?"
# user = gets.chomp
# add_user(db, user)
# set_expected_income(db, user, 2000)

# puts current_income(db, user)