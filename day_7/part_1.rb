#input beam 
# split beam by row iterating through
# count as you go 

def get_init_grid
  File.read('input.txt').split("\n").map{|row| row.split('')}
end

def main
  grid = get_init_grid
  pp grid

  # start a count
  count = 0
  # start on first row find S
  col_i = grid[0].index("S")
  grid[0][col_i] = "|"
  pp grid
  # go to next row 
  above_row_beam_indexes = [col_i]
  
  grid.each_with_index do |curr_row, row_index|
  # we have the above row.
    temp_above_row_beam_indexes = []
    # carry each pipe down to the current row. 
    above_row_beam_indexes.each do |above_row_beam_i|
      spot_below_beam = curr_row[above_row_beam_i]
      if spot_below_beam == "^"
        count += 1
        # update grid
        # grid[row_index][above_row_beam_i-1] = "|"
        # grid[row_index][above_row_beam_i+1] = "|"
        # update above_row redundant
        temp_above_row_beam_indexes << above_row_beam_i-1
        temp_above_row_beam_indexes << above_row_beam_i+1
      else 
        # grid[row_index][above_row_beam_i] = "|"
        temp_above_row_beam_indexes << above_row_beam_i
      end
    end
    above_row_beam_indexes = temp_above_row_beam_indexes.uniq
  end

  # pp grid
  count
end

pp main