require 'sqlite3'

#create database
db = SQLite3::Database.new("cache.db")

#create table if not already existant
create_table = '
CREATE TABLE IF NOT EXISTS budgets(
id INTEGER PRIMARY KEY,
cache INTEGER,
expected_income INTEGER,
actual_income INTEGER
)'

db.execute(create_table) 

add_user = '
INSERT INTO budgets (cache, expected_income, actual_income)
VALUES (0,0,0)'

# db.execute(add_user) - want this to run only once for single user

# --methods to retreive and manipulate table data--
# method to set expected income 
def set_expected_income(db, dolla_dolla_bills_yall)
	expected_income = '
	UPDATE budgets SET expected_income = ?
	WHERE id = 1' 
	db.execute(expected_income, [dolla_dolla_bills_yall]) 
end

