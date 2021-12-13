require "json"

def read_from_db
  db_text = File.read("#{File.dirname(Pathname.new(__FILE__).realpath)}/../db.txt")
  JSON.parse(db_text)
end