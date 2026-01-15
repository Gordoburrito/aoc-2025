# frozen_string_literal: true

def get_tiles
  File.read('input_example.txt').split("\n").map{|tile| tile.split(',').map(&:to_i)}
  # break tiles in arrays
end


def build_perimeter
  # but the tiles[1] doesn't have more than 2
  x_edges = {}
  y_edges = {}
  # [min_y, max_y] = find_min_max_y

  # find_neighbors trace the perimeter
  # @tiles.each do |tile|
  #   find_neighbors already found? neighbors each build perimeter
  #   # 
  # find_x_neighbors
  # find_y_neighbors
  
  # make x_edges from neighbors
  # make y_edges

  # trace edges and make perimter like this 
  #   # {1=>[7,11], 2=>[7,11]...}



  # construct perimeter
  # then we do blah blah
  
  # {1=>[7, 11], 7=>[11, 9], 5=>[9, 2], 3=>[2, 7]}
  @tiles.map do |tile|
    x_edges[tile[1]] ||= []
    # tiles with 
    # the y column key what points are on the x
    x_edges[tile[1]] << tile[0]
  end

  @tiles.map do |tile|
    y_edges[tile[0]] ||= []
    # tiles with 
    # the y column key what points are on the x
    y_edges[tile[0]] << tile[1]
  end

  [x_edges.sort.to_h, y_edges.sort.to_h]
  # go through find neighbors for tile. 
  # perimeter
  #   @tiles.map do |tile|
  #     tile[1]
  #   end.tally
end


#   find adjacent points 
#   { y: [x, x,x]
#   init y 
# end

# def max_bounds_perimeter(perimeter)
#   build outside perimeter by min maxing the y column's x's 
#     arr[column] // [min_x, max_x]
# end

# def is_valid?
#   check if in max_bounds_perimeter
#   by checking each column if its in bounds of min x and max x 
# end

def main
  @tiles = get_tiles
  tiles_size = @tiles.size
  # max_area = 0
  # pairs = []

  # tiles_size.times do |i|
  #   (tiles_size - i - 1).times do |j|
  #     pairs << [i, j + i + 1]
  #   end
  # end

  perimeter = build_perimeter
  # # max_perimeter = max_bounds_perimeter(perimeter)

  # pairs.each do |pair|
  #   area = get_area(pair)
  #   max_area = [max_area, area].max if is_valid?(max_perimeter, pairs)
  # end
  return perimeter
end

pp "points of perimeter"
pp main