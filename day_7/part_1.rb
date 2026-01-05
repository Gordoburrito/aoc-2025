#input beam 
# split beam by row iterating through
# count as you go 

def get_init_grid
  File.read('input_example.txt').split("\n").map{|row| row.split('')}
end

def main
  grid = get_init_grid
  pp grid

  # start a count
  count = 0
  # start on first row find S
  col_i = grid[0].indexOf("S")
  grid[0][col_i] = "|"
  # go to next row 
  above_rowd = [col_i]
  
  grid.each_with_index do |xxxxxxxx, xxxxxx|
    # we have the above row.
    # carry each pipe down to the current row. 
    above_row.each do |beam_col_i|
      curr_beam_pos = curr_row_i[beam_col_i]
        if curr_beam_pos == "^"
          count++
          # update grid
          grid[curr_row_i][curr_beam_pos-1] = "|"
          grid[curr_row_i][curr_beam_pos+1] = "|"
          # update above_row redundant
          temp_above_row << curr_beam_pos-1
          temp_above_row << curr_beam_pos+1
        else 
          aboved_row = current_row
        end
      end 
      return the count

  # carry the | down
  # if the column below a "|" is "^"" split to its neighbors
    # count the split
  # if tis a "|" carry it down to the next row
end

main