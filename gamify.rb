# add lib folder to load path
$LOAD_PATH << './lib'

require "print-char-sheet"
require "json"
require "read-from-db"

if ARGF.argv.empty?
  print_char_sheet(read_from_db)

elsif ARGF.argv.length == 1 && ARGF.argv[0] == "-milestone"
  print "Next milestone: "
  milestone = STDIN.gets.chomp
  data = read_from_db
  data["next_milestone"] = milestone
  File.write("db.txt", JSON.generate(data))
  print_char_sheet(read_from_db)

elsif ARGF.argv.length == 1 && ARGF.argv[0] == "-add"
  puts "TO DO"

else
  puts "USAGE: gamify / gamify -add / gamify -milestone"
end