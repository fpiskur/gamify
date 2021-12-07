def split_long_row (text, max_length)
  splited_text = text.split
  row = ""
  rows = []

  splited_text.each do |word|
    if row.empty?
      row += word
    elsif (row + " " + word).length <= max_length
      row = row + " " + word
    else
      rows << row
      row = word
    end
  end
  
  unless row.empty?
    rows << row
  end

  rows
end