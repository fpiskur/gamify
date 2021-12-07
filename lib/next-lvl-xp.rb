def get_next_lvl_xp(current_lvl, current_lvl_xp)
  if current_lvl == 0
    1000
  else
    ( ((current_lvl + 1) * 10) + ((current_lvl_xp / 100) / 1.5) + ( ((current_lvl + 1)**4) / ((current_lvl_xp / 100) * 0.17) ) - 11 ).round(0) * 100
  end
end