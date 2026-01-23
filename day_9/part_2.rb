# frozen_string_literal: true

def get_tiles
  File.read('input_example_w_edge_case_vert_tooth.txt').split("\n").map{|tile| tile.split(',').map(&:to_i)}
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
  # returns row indexes where a vertical edge intersects the row
  vertical_edges.select do |_col, row_span|
    (row_span[0]..row_span[1]).include?(row)
  end.keys
end

def find_vertical_edges_range(vertical_edges)
  a, b = vertical_edges.values.flatten.minmax
  (a..b)
end

def find_valid_ranges_for_row(vertical_edges, intersecting_edges, row)
  # TODO
  # traverse the intersecting_edges
  # keep track of in/out
  # collect indexes until you pop out
  # minmax the collections
  # when you go back in, start a new collection
  # etc
  # bryant's theory
  # - first index is in
  # - following indexes
  #   - in if there's odd number of tiles in the col
  #   - out if there's even number of tiles in the col
  # - hopefully in when we hit the last index ... throw an error or someth
end

def get_valid_ranges(vertical_edges)
  valid_ranges = {}
  range_minmax_v_edges = find_vertical_edges_range(vertical_edges)
  range_minmax_v_edges.each do |row|
    intersecting_edges = find_intersecting_edges(vertical_edges, row)
    valid_ranges[row] = find_valid_ranges_for_row(vertical_edges, intersecting_edges, row)
  end
  valid_ranges
end

def is_valid_point?(vertical_sides_point, valid_ranges)
  row = vertical_sides_point[1]
  col = vertical_sides_point[0]
  valid_ranges[row].include?(col)
end

def is_valid_group?(vertical_sides, valid_ranges)
  vertical_sides.all? do |vertical_sides_point|
    is_valid_point?(vertical_sides_point, valid_ranges)
  end
end

def get_vertical_sides(opposite_corner_pair)
  vertical_sides = []
  side_a_start = opposite_corner_pair[0]
  side_b_start = opposite_corner_pair[1]
  side_a_end = [side_a_start[0], side_b_start[1]]
  y_min, y_max = [side_a_start[1],side_a_end[1]].sort

  (y_min..y_max).each do |y|
    vertical_sides << [side_a_start[0], y]
    vertical_sides << [side_b_start[0], y]
  end
  vertical_sides
end

def four_corners_are_valid(opposite_corner_pair, valid_ranges)
  four_corners = opposite_corner_pair.dup
  side_a_start = opposite_corner_pair[0]
  side_b_start = opposite_corner_pair[1]

  side_a_end = [side_a_start[0], side_b_start[1]]
  side_b_end = [side_b_start[0], side_a_start[1]]
  four_corners << side_a_end
  four_corners << side_b_end

  is_valid_group?(four_corners, valid_ranges)
end

def get_valid_opposite_corners(opposite_corners, valid_ranges)
  opposite_corners.select do |opposite_corner_pair|
    if !four_corners_are_valid(opposite_corner_pair, valid_ranges)
      false
    else
      vertical_sides = get_vertical_sides(opposite_corner_pair)
      is_valid_group?(vertical_sides, valid_ranges)
      # TODO
      # check horizontal_sides too
    end
  end
end

def get_area(pair)
  corner_1_x, corner_1_y = pair[0]
  corner_2_x, corner_2_y = pair[1]

  x_diff = (corner_1_x - corner_2_x).abs + 1
  y_diff = (corner_1_y - corner_2_y).abs + 1

  x_diff * y_diff
end

def get_max_area(pairs)
  max_area = 0
  pairs.each do |pair|
    max_area = [max_area, get_area(pair)].max
  end
  max_area
end

def get_max_area(pairs)
  max_area = 0
  pairs.each do |pair|
    max_area = [max_area, get_area(pair)].max
  end
  max_area
end

def get_max_area_w_corners(pairs)
  max_area = 0
  max_pair = nil
  pairs.each do |pair|
    area = get_area(pair)
    max_area = [max_area, area].max
    max_pair = pair if area == max_area
  end
  [max_area, max_pair]
end

def main
  @tiles = get_tiles

  vertical_edges = get_vertical_edges
  # pp 'vertical_edges'
  # pp vertical_edges
  valid_ranges = get_valid_ranges(vertical_edges)
  # pp 'valid_ranges'
  # pp valid_ranges
  opposite_corners = get_opposite_corners
  # pp 'opposite_corner'
  # pp opposite_corners.size
  valid_opposite_corners = get_valid_opposite_corners(opposite_corners, valid_ranges)
  # pp 'valid_opposite_corners'
  # pp valid_opposite_corners
  # get_max_area(valid_opposite_corners)
  get_max_area_w_corners(valid_opposite_corners)
end

pp main

# too high ... just four_corners
# "valid_ranges"
# 96677
# "opposite_corner"
# 122760
# "valid_opposite_corners"
# 3146
# 4589308260

# too low ... checks sides too
# "valid_ranges"
# 96677
# "opposite_corner"
# 122760
# "valid_opposite_corners"
# 1644
# 1289423295
