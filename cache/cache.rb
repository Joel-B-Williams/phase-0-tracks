require 'sqlite3'
require 'date'

# create database
db = SQLite3::Database.new("cache.db")

# create tables

create_tables = '

CREATE TABLE IF NOT EXISTS users(
id INTEGER PRIMARY KEY,
name VARCHAR(255),
expected_income INTEGER,
actual_income INTEGER,
total_expenses INTEGER,
cache INTEGER,
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

# Base Methods to add user/category/expense

def add_user(db, user_name)
	new_user = '
	INSERT INTO users (name, expected_income, month)
	VALUES (?, 0, 1)'
	db.execute(new_user, [user_name])
end

def add_category(db, category)
	new_category = '
	INSERT INTO categories (name)
	VALUES (?)'
	db.execute(new_category, [category])
end

def add_expense(db, user_id, category_id, amount)
	new_expense = '
	INSERT INTO expenses (user_id, category_id, amount)
	VALUES (?,?,?)'
	db.execute(new_expense, [user_id, category_id, amount])
end

### INTERACT WITH USERS TABLE

# Method to set expected income
def set_expected_income(db, user_name, dollars)
	new_expected_income = '
	UPDATE users 
	SET expected_income = ?
	WHERE name = ?'
	db.execute(new_expected_income, [dollars, user_name])
end

# Method to set total budget
def set_total_budget(db, user_name, dollars)
	new_total_budget = '
	UPDATE users
	SET total_budget = ?
	WHERE name = ?'
	db.execute(new_total_budget, [dollars, user_name])
end

### Methods to check/update month

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


# ==== DRIVER CODE ====
puts "Welcome to Cache!  Please enter your username."
user = gets.chomp 
puts "Do you have an existing account? (y/n)"
account = gets.chomp

add_user(db, user) if account[0].downcase == "n"

while check_month(db, user) != Date.today.month
	# monthly_reset(db, user)
	change_month(db, user)
end

# OPTIONS TO INCLUDE...
# display various
# set expected income
# add expense (do via printing/selecing/indexing??)
# add category