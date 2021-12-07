$reset_color = "\u001b[0m"
#############################################
# Basic colors
def red (string)
  "\e[#{31}m#{string}\e[0m" + $reset_color
end

def green (string)
  "\e[#{32}m#{string}\e[0m" + $reset_color
end

def yellow (string)
  "\e[#{33}m#{string}\e[0m" + $reset_color
end

def blue (string)
  "\e[#{34}m#{string}\e[0m" + $reset_color
end

def magenta (string)
  "\e[#{35}m#{string}\e[0m" + $reset_color
end

def cyan (string)
  "\e[#{36}m#{string}\e[0m" + $reset_color
end
#############################################
# Bright colors
def bright_red (string)
  "\e[#{31}m#{string}\e[1m" + $reset_color
end

def bright_green (string)
  "\e[#{32}m#{string}\e[1m" + $reset_color
end

def bright_yellow (string)
  "\e[#{33}m#{string}\e[1m" + $reset_color
end

def bright_blue (string)
  "\e[#{34}m#{string}\e[1m" + $reset_color
end

def bright_magenta (string)
  "\e[#{35}m#{string}\e[1m" + $reset_color
end

def bright_cyan (string)
  "\e[#{36}m#{string}\e[1m" + $reset_color
end
#############################################
# Dark colors
def dark_red (string)
  "\e[#{31}m#{string}\e[2m" + $reset_color
end

def dark_green (string)
  "\e[#{32}m#{string}\e[2m" + $reset_color
end

def dark_yellow (string)
  "\e[#{33}m#{string}\e[2m" + $reset_color
end

def dark_blue (string)
  "\e[#{34}m#{string}\e[2m" + $reset_color
end

def dark_magenta (string)
  "\e[#{35}m#{string}\e[2m" + $reset_color
end

def dark_cyan (string)
  "\e[#{36}m#{string}\e[2m" + $reset_color
end
#############################################
# Basic background colors
def bg_red (string)
  "\e[#{41}m#{string}\e[0m" + $reset_color
end

def bg_green (string)
  "\e[#{42}m#{string}\e[0m" + $reset_color
end

def bg_yellow (string)
  "\e[#{43}m#{string}\e[0m" + $reset_color
end

def bg_blue (string)
  "\e[#{44}m#{string}\e[0m" + $reset_color
end

def bg_magenta (string)
  "\e[#{45}m#{string}\e[0m" + $reset_color
end

def bg_cyan (string)
  "\e[#{46}m#{string}\e[0m" + $reset_color
end