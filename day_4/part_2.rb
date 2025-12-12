# frozen_string_literal: true

def get_init_grid
  # File.read('input_example.txt').split("\n").map { |row| row.split('') }
  File.read('input.txt').split("\n").map { |row| row.split('') }
end

def get_padded_grid
  # grid = File.read('input_example.txt').split("\n").map { |row| row.split('') }
  grid = File.read('input.txt').split("\n").map { |row| row.split('') }
  grid.each do |row|
    row << '.'
    row.unshift('.')
  end
  row_length = grid[0].length
  arr = Array.new(row_length, '.')
  grid << arr
  grid.unshift(arr)
end

def get_adjacent_vals(row_index, col_index)
  offsets = [
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [0, -1],
    [0, 1],
    [1, -1],
    [1, 0],
    [1, 1]
  ]

  padded_row_index = row_index + 1
  padded_col_index = col_index + 1

  offsets.map do |offset|
    @padded_grid[padded_row_index + offset[0]][padded_col_index + offset[1]]
  end
end

def remove_rolls(count)
  current_store = []
  
  @init_grid.each_with_index do |row, row_index|
    row.each_with_index do |target, col_index|
      next if target == '.'

      adjacent_vals = get_adjacent_vals(row_index, col_index)
      removable = adjacent_vals.count('@') < 4

      if removable
        current_store << [row_index, col_index]
        count += 1 
      end
    end
  end

  if current_store.empty?
    return count
  end

  current_store.each do |coords| 
    row, col = coords
    @init_grid[row][col] = "."
    @padded_grid[row + 1][col + 1] = "."
  end

  remove_rolls(count)
end


def main
  @init_grid = get_init_grid
  @padded_grid = get_padded_grid

  count = 0
  # for each row, get '@'
  # for each '@' index check following:
  # target index row -1 index -1, etc.
  remove_rolls(count)
end

pp main