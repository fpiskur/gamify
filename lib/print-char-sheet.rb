require "split-long-row"
require "terminal-colors"
require "next-lvl-xp"

def print_char_sheet (data)

  # Sections width (not including edges or margins), 1: levels & XP, 2: stats, 3: XP indicator & milestone
  sec_1_width = 21
  sec_2_width = 28
  sec_3_width = 60

  # First and last row of "character sheet"
  divider = "#" * 64
  # Left and right edge of "character sheet"
  col_edge = "|"
  # Top and bottom edge of "character sheet"
  row_edge = col_edge + "-" * 62 + col_edge
  # Section 1 divider line
  sec_1_divider = col_edge + "-" * (sec_1_width + 2) + col_edge

  # Left and right margin for section 3, Left margin for section 1
  margin = " "
  # Left and right margin for section 2
  sec_2_margin = " " * 5
  # Top and bottom margin for section 3
  sec_3_margin = col_edge + " " * 62 + col_edge

  # Stats indicator length
  indicator_length = 15

  # DATA
  level = data["current_lvl"]
  xp = data["current_xp"]
  current_lvl_xp = data["current_lvl_xp"]
  next_lvl_xp = get_next_lvl_xp(level, current_lvl_xp)
  next_lvl_indicator = ((xp - current_lvl_xp) / (next_lvl_xp - current_lvl_xp).to_f * sec_3_width).round(0)
  water = data["water"] ? indicator_length : 0
  sleeping = data["sleep"] ? indicator_length : 0
  workout = data["workout"] ? indicator_length : 0
  meditation = data["meditation"] ? indicator_length : 0
  fruit_veg = data["fruit_veg"] ? indicator_length : 0
  next_milestone = data["next_milestone"]
  # next_milestone = "Lorem ipsum dolor sit amet, sarma karma pesek jede jelenji rog ko da joj je zadnje u životu, a ne da će i sutra dobit opet klopu i rog i sve ostalo"

  # Labels / "boxes"
  current_lvl_box = "LEVEL: " + "#{level}"
  xp_box = "XP: " + "#{xp}"
  next_lvl_box = "NEXT LVL: " + "#{next_lvl_xp}" + " XP"
  water_box = "water: "
  sleeping_box = "sleep: "
  workout_box = "workout: "
  meditation_box = "meditation: "
  fruit_veg_box = "fruit&veg: "
  next_milestone_box = "Next milestone: "

  # Start printing character sheet
  puts  # spacer
  puts divider, row_edge
  
  # 1st row
  print col_edge + margin + current_lvl_box
  print " " * (sec_1_width - current_lvl_box.length)
  print margin + col_edge

  print sec_2_margin + water_box + " " * (sec_2_width - indicator_length - water_box.length)
  print bg_blue(" ") * water + bright_blue("-") * (indicator_length - water)
  print sec_2_margin + col_edge
  
  puts

  # 2nd row
  print sec_1_divider + sec_2_margin + sleeping_box + " " * (sec_2_width - indicator_length - sleeping_box.length)
  print bg_cyan(" ") * sleeping + bright_cyan("-") * (indicator_length - sleeping)
  print sec_2_margin + col_edge

  puts

  # 3rd row
  print col_edge + margin + xp_box
  print " " * (sec_1_width - xp_box.length)
  print margin + col_edge
  
  print sec_2_margin + workout_box + " " * (sec_2_width - indicator_length - workout_box.length)
  print bg_red(" ") * workout + bright_red("-") * (indicator_length - workout)
  print sec_2_margin + col_edge

  puts

  # 4th row
  print sec_1_divider + sec_2_margin + meditation_box + " " * (sec_2_width - indicator_length - meditation_box.length)
  print bg_magenta(" ") * meditation + bright_magenta("-") * (indicator_length - meditation)
  print sec_2_margin + col_edge

  puts

  # 5th row
  print col_edge + margin + next_lvl_box
  print " " * (sec_1_width - next_lvl_box.length)
  print margin + col_edge
  
  print sec_2_margin + fruit_veg_box + " " * (sec_2_width - indicator_length - fruit_veg_box.length)
  print bg_yellow(" ") * fruit_veg + bright_yellow("-") * (indicator_length - fruit_veg)
  print sec_2_margin + col_edge

  puts

  # Level indicator
  puts row_edge
  print col_edge + margin
  print bg_green(" ") * next_lvl_indicator + bright_green("-") * (sec_3_width - next_lvl_indicator)
  print margin + col_edge
  puts

  puts row_edge

  # Next milestone
  puts sec_3_margin
  print col_edge + margin
  print next_milestone_box

  rows = split_long_row(next_milestone, sec_3_width - next_milestone_box.length)
  rows.each do |row|
    if row == rows.first
      puts row + " " * (sec_3_width - next_milestone_box.length - row.length) + margin + col_edge
    else
      puts col_edge + margin +  " " * next_milestone_box.length + row + " " * (sec_3_width - next_milestone_box.length - row.length) + margin + col_edge
    end
  end

  puts sec_3_margin

  puts row_edge, divider
  puts  # spacer

end