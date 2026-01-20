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
    x_edges[tile[1]].sort!
    # {1=>[7, 11], 7=>[11, 9], 5=>[9, 2], 3=>[2, 7]}
    
    # find_y_neighbors
    # make y_edges
    y_edges[tile[0]] ||= []
    y_edges[tile[0]] << tile[1]
    y_edges[tile[0]].sort!
    # {2=>[5, 3], 7=>[1, 3], 9=>[7, 5], 11=>[1, 7]}
  end


  def handle_y_edge(prev_x_corner, full_perimeter, x_edges, y_edges)
    puts prev_x_corner
    puts y_edges
    current_y_edge = y_edges[prev_x_corner] # // 11=>[1,7]
    pp 'current_y_edge'
    pp current_y_edge
    y_range = (current_y_edge[0]..current_y_edge[1]).to_a
    
    # fill outer perimeter of rows from y_edges
    y_range.each do |row|
      full_perimeter[row] ||= []
      full_perimeter[row] << prev_x_corner
      full_perimeter[row].sort!
      pp full_perimeter
    end

    handle_x_edge(current_y_edge[1], full_perimeter, x_edges, y_edges)
  end

  def handle_x_edge(prev_y_corner, full_perimeter, x_edges, y_edges)
    # fill outer perimeter from x_edge
    
    # TODO: pass in prev_y_corner = [7, 11]
    current_x_edge = x_edges[prev_y_corner] # // 7=> [9,11]
    full_perimeter[prev_y_corner] << current_x_edge[0] # 

    # NOTE: WE NEED TO PASS THE ACTUAL CORNER SO WE KNOW THE DIRECTION WE ARE GOING IN!

    handle_y_edge(current_x_edge[1], full_perimeter)
  end

  x_edges, y_edges = [x_edges.sort.to_h, y_edges.sort.to_h]

  puts x_edges
  puts y_edges
    # //trace the outside. 
  starting_corner = x_edges[1][1]

  full_perimeter = {}
  # {1=> [7,11], 2=> [7,11]...}
  handle_y_edge(starting_corner, full_perimeter, x_edges, y_edges)
    # or calc within the edges
  full_perimeter
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
