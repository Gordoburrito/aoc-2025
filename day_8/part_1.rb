# frozen_string_literal: true

def get_points
  File.read('input_example.txt').split("\n").map { |row| row.split(',').map(&:to_i) }
end

def get_distance(pt_a, pt_b)
  a_x, a_y, a_z = pt_a
  b_x, b_y, b_z = pt_b
  Math.sqrt((a_x - b_x)**2 + (a_y - b_y)**2 + (a_z - b_z)**2)
end

def main
  points = get_points
  num_pts = points.length
  pairs = []

  num_pts.times do |i|
    (num_pts - i - 1).times do |j|
      pairs << [i, j + i + 1]
    end
  end
  pairs.sort_by do |pair|
    get_distance(points[pair[0]], points[pair[1]])
  end
end

pp main
