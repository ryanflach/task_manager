require 'sqlite3'

database = SQLite3::Database.new("db/task_manager_development.db")

database.execute("DELETE FROM tasks;")

10.times do |n|
  database.execute("INSERT INTO tasks(title, description) VALUES('Go to the gym #{n + 1} times', 'Do #{n + 1} pullups');")
end

puts database.execute("SELECT * FROM tasks;")
