# frozen_string_literal: true

def get_tiles
  File.read('input_example.txt').split("\n").map{|tile| tile.split(',').map(&:to_i)}
  # break tiles in arrays
end


def build_permiter 
  find adjacent points 
  { y: [x, x,x]
  init y 
end

def max_bounds_perimeter(perimeter)
  build outside perimeter by min maxing the y column's x's 
    arr[column] // [min_x, max_x]
end

def is_valid?
  check if in max_bounds_perimeter
  by checking each column if its in bounds of min x and max x 
end

# def main
#   @tiles = get_tiles
#   tiles_size = @tiles.size
#   max_area = 0
  
#   pairs = []

#   tiles_size.times do |i|
#     (tiles_size - i - 1).times do |j|
#       pairs << [i, j + i + 1]
#     end
#   end

#   pairs.each do |pair|
#     area = get_area(pair)
#     max_area = [max_area, area].max if is_valid?
#   end

#   return max_area
# end

# pp main