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
  col_i = grid[0].index("S")
  grid[0][col_i] = "|"
  pp grid
  # go to next row 
  above_row_beam_indexes = {col_i => 1} 
  
  grid.each_with_index do |curr_row, row_index|
    # we have the above row.
    # carry each pipe down to the current row. 
    temp_above_row_beam_indexes = {}
    
    pp above_row_beam_indexes
    
    above_row_beam_indexes.each_key do |above_row_beam_i|  
      spot_below_beam = curr_row[above_row_beam_i]
      beam_count = above_row_beam_indexes[above_row_beam_i]
      if spot_below_beam == "^"
        count += beam_count * 2
        temp_above_row_beam_indexes[above_row_beam_i-1] ||= 0
        temp_above_row_beam_indexes[above_row_beam_i+1] ||= 0
        temp_above_row_beam_indexes[above_row_beam_i-1] += beam_count
        temp_above_row_beam_indexes[above_row_beam_i+1] += beam_count
      else 
        temp_above_row_beam_indexes[above_row_beam_i] = beam_count
      end
    end
    
    above_row_beam_indexes = temp_above_row_beam_indexes.dup
  end

  count
end

pp main