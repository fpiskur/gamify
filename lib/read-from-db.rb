require "json"

def read_from_db
  db_text = File.read("db.txt")
  JSON.parse(db_text)
end