# frozen_string_literal: true

require 'set'

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
  sorted_pairs = pairs.sort_by do |pair|
    get_distance(points[pair[0]], points[pair[1]])
  end[0..10]

  circuits = []
  sorted_pairs.each do |pair|
    existing_cirs = circuits.select do |circuit|
      circuit.include?(pair[0]) || circuit.include?(pair[1])
    end
    if existing_cirs
      merged = Set.new
      existing_cirs.each {|cir| merged.merge(cir)}
      merged.merge(pair)
      circuits -= existing_cirs
      circuits << merged
    else
      circuits << Set.new(pair)
    end
  end
  circuits = circuits.sort_by(&:size).reverse
  circuits[0].size * circuits[1].size * circuits[2].size
end

pp main
