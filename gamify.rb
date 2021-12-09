# add lib folder to load path
$LOAD_PATH << './lib'

require "print-char-sheet"
require "json"
require "read-from-db"

hours_worked = 0
drank_water = false
enough_sleep = false
did_workout = false
did_meditation = false
ate_fruit_veg = false
earned_bonus = false

positive = ["da", "DA", "d", "D", "yes", "YES", "y", "Y"]
negative = ["ne", "NE", "n", "N", "no", "NO"]
possible_bool_answers = positive + negative

bonus_coefficient = 0.5
bonuses = {
  1 => "Finished a project",
  2 => "Refactored old code",
  3 => "Finished a milestone"
}
bonus_source = 0
xp_per_hour = 100

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
  loop do
    print "Hours of work today: "
    hours_worked = STDIN.gets.chomp
    break if hours_worked.to_i.to_s == hours_worked && hours_worked.to_i >= 0
    puts "Use positive integer or 0!"
  end
  hours_worked = hours_worked.to_i

  loop do
    print "Drank 1.5L of water? "
    drank_water = STDIN.gets.chomp
    break if positive.include?(drank_water) || negative.include?(drank_water)
    puts "Possible answers: " + possible_bool_answers.to_s
  end
  drank_water = positive.include?(drank_water) ? true : false
  
  loop do
    print "Got at least 8h of sleep? "
    enough_sleep = STDIN.gets.chomp
    break if positive.include?(enough_sleep) || negative.include?(enough_sleep)
    puts "Possible answers: " + possible_bool_answers.to_s
  end
  enough_sleep = positive.include?(enough_sleep) ? true : false

  loop do
    print "Did at least 30min of workout? "
    did_workout = STDIN.gets.chomp
    break if positive.include?(did_workout) || negative.include?(did_workout)
    puts "Possible answers: " + possible_bool_answers.to_s
  end
  did_workout = positive.include?(did_workout) ? true : false

  loop do
    print "Did at least 15min of meditation? "
    did_meditation = STDIN.gets.chomp
    break if positive.include?(did_meditation) || negative.include?(did_meditation)
    puts "Possible answers: " + possible_bool_answers.to_s
  end
  did_meditation = positive.include?(did_meditation) ? true : false

  loop do
    print "Ate enough fruit and vegetables? "
    ate_fruit_veg = STDIN.gets.chomp
    break if positive.include?(ate_fruit_veg) || negative.include?(ate_fruit_veg)
    puts "Possible answers: " + possible_bool_answers.to_s
  end
  ate_fruit_veg = positive.include?(ate_fruit_veg) ? true : false

  loop do
    print "Earned a bonus? (finished project, refactored old code, finished a milestone, finished practice assignment) "
    earned_bonus = STDIN.gets.chomp
    break if positive.include?(earned_bonus) || negative.include?(earned_bonus)
    puts "Possible answers: " + possible_bool_answers.to_s
  end
  earned_bonus = positive.include?(earned_bonus) ? true : false

  if earned_bonus
    puts "What did you do to earn a bonus?"
    bonuses.each do |key, value|
      puts "#{key} - #{value}"
    end

    bonus_xp = 0
    hours_for_bonus = 0

    loop do
      print "Answer: "
      bonus_source = STDIN.gets.chomp.to_i
      break if bonuses.keys.include?(bonus_source)
      puts "Please input a number of one of the tasks above!"
    end

    loop do
      print "How many hours? "
      hours_for_bonus = STDIN.gets.chomp
      break if hours_for_bonus.to_i.to_s == hours_for_bonus && hours_worked.to_i > 0
      puts "Use positive integer!"
    end
    hours_for_bonus = hours_for_bonus.to_i

  end

  

else
  puts "USAGE: gamify / gamify -add / gamify -milestone"
end