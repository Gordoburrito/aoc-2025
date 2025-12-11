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

def main
  @init_grid = get_init_grid
  @padded_grid = get_padded_grid
end

pp main
