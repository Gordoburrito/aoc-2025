# frozen_string_literal: true

def get_tiles
  File.read('input.txt').split("\n").map{|tile| tile.split(',').map(&:to_i)}
  # break tiles in arrays
end


def get_vertical_edges
  vertical_edges = {}
  # construct perimeter
  
  @tiles.map do |tile|
    # find_y_neighbors
    # make vertical_edges
    vertical_edges[tile[0]] ||= []
    vertical_edges[tile[0]] << tile[1]
    vertical_edges[tile[0]].sort!
    # {2=>[5, 3], 7=>[1, 3], 9=>[7, 5], 11=>[1, 7]}
  end
  vertical_edges.sort.to_h
end

def get_opposite_corners
  tiles_size = @tiles.size
  opposite_corners = []

  tiles_size.times do |i|
    (tiles_size - i - 1).times do |j|
      opposite_corners << [i, j + i + 1]
    end
  end
  
  opposite_corners.map do |opp_corner|
    [@tiles[opp_corner[0]], @tiles[opp_corner[1]]]
  end

end

def find_intersecting_edges(vertical_edges, row)
  # select where the row is in between the value range .keys
  vertical_edges.select do |col, row_span|
    
    (row_span[0]..row_span[1]).include?(row)
  end.keys.minmax

end

def is_valid_corner?(corner, vertical_edges)
  # corner: [2, 3]
  # {2=>[3, 5], 7=>[1, 3], 9=>[5, 7], 11=>[1, 7]}
  row = corner[1]
  col = corner[0]
  intersecting_edges = find_intersecting_edges(vertical_edges, row)
  valid_range = intersecting_edges[0]..intersecting_edges[1]
  valid_range.include?(col)
end

def is_valid_group?(corners, vertical_edges)
  corners.all? do |corner|
    is_valid_corner?(corner, vertical_edges)
  end
end

def get_all_corners(opposite_corner_pair)
  new_point_1 = [opposite_corner_pair[0][0], opposite_corner_pair[1][1]]
  new_point_2 = [opposite_corner_pair[1][0], opposite_corner_pair[0][1]]
  opposite_corner_pair << new_point_1
  opposite_corner_pair << new_point_2
end

def get_valid_opposite_corners(opposite_corners, vertical_edges)
  opposite_corners.select do |opposite_corner_pair|
    corners = get_all_corners(opposite_corner_pair)
    is_valid_group?(corners, vertical_edges)
  end
end

def get_area(pair)
  corner_1_x, corner_1_y = pair[0]
  corner_2_x, corner_2_y = pair[1]
  
  x_diff = (corner_1_x - corner_2_x).abs + 1
  y_diff = (corner_1_y - corner_2_y).abs + 1

  return x_diff * y_diff
end

def get_max_area(pairs)
  max_area = 0
  pairs.each do |pair|
    max_area = [max_area, get_area(pair)].max
  end
  max_area
end

def main
  @tiles = get_tiles

  vertical_edges = get_vertical_edges
  opposite_corners = get_opposite_corners
  valid_opposite_corners = get_valid_opposite_corners(opposite_corners, vertical_edges)
  max_area = get_max_area(valid_opposite_corners)
  return max_area
end

# pp "rectangles"
pp main
