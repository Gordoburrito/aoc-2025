# frozen_string_literal: true

def get_tiles
  File.read('input.txt').split("\n").map{|tile| tile.split(',').map(&:to_i)}
  # break tiles in arrays
end

def get_area(pair)
  corner_1_x, corner_1_y = @tiles[pair[0]]
  corner_2_x, corner_2_y = @tiles[pair[1]]
  
  x_diff = (corner_1_x - corner_2_x).abs + 1
  y_diff = (corner_1_y - corner_2_y).abs + 1

  return x_diff * y_diff
end

def main
  @tiles = get_tiles
  tiles_size = @tiles.size
  max_area = 0
  
  pairs = []

  tiles_size.times do |i|
    (tiles_size - i - 1).times do |j|
      pairs << [i, j + i + 1]
    end
  end

  pairs.each do |pair|
    max_area = [max_area, get_area(pair)].max
  end

  return max_area
end

pp main