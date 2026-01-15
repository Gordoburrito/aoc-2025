# frozen_string_literal: true

def get_tiles
  File.read('input_example.txt').split("\n").map{|tile| tile.split(',').map(&:to_i)}
  # break tiles in arrays
end


def build_perimeter
  x_edges = {}
  y_edges = {}
  # construct perimeter
  
  @tiles.map do |tile|
    # find_x_neighbors
    # make x_edges
    x_edges[tile[1]] ||= []
    x_edges[tile[1]] << tile[0]
    # {1=>[7, 11], 7=>[11, 9], 5=>[9, 2], 3=>[2, 7]}
    
    # find_y_neighbors
    # make y_edges
    y_edges[tile[0]] ||= []
    y_edges[tile[0]] << tile[1]
    # {2=>[5, 3], 7=>[1, 3], 9=>[7, 5], 11=>[1, 7]}
  end

  # idea to
  # trace edges and make perimter like this 
  #   # {1=>[7,11], 2=>[7,11]...}

  # or calc within the edges

  [x_edges.sort.to_h, y_edges.sort.to_h]
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