require 'sqlite3'

#create database
db = SQLite3::Database.new("cache.db")

#create table if not already existant
create_table = '
CREATE TABLE IF NOT EXISTS budgets(
id INTEGER PRIMARY KEY,
cache INTEGER,
expected_income INTEGER
actual_income INTEGER
)'

db.execute(create_table) 
#methods to retreive and manipulate table data