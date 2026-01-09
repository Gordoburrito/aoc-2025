# frozen_string_literal: true

def get_points
  File.read('input_example.txt').split("\n").map { |row| row.split(',').map(&:to_i) }
end

def get_distance(pt_a, pt_b)
  a_x, a_y, a_z = pt_a
  b_x, b_y, b_z = pt_b
  Math.sqrt((a_x - b_x)**2 + (a_y - b_y)**2 + (a_z - b_z)**2)
end

def find_existing_circuit(pt_i)
  @circuits.each_with_index do |circuit, i|
    return i if circuit.include?(pt_i)
  end
  nil
end

def add_to_existing_circuit(pt_i, index)
  @circuits[index] << pt_i
end

def create_new_circuit(curr_pt_i, pt_i)
  @circuits << [curr_pt_i, pt_i]
end

def main
  points = get_points
  @circuits = [] # array of arrays, each array contains point indexes describing a circuit
  # pp 'points'
  pp points
  # pp '~' * 20
  points.each_with_index do |curr_pt, curr_pt_i|
    curr_pt_existing_circuit_index = find_existing_circuit(curr_pt_i)
    # pp curr_pt
    other_pts = points[(curr_pt_i + 1)..-1]
    next if other_pts.empty?

    # pp other_pts
    # sorted_other_pts = other_pts.sort_by do |other_pt|
    #   get_distance(curr_pt, other_pt)
    # end
    distances = other_pts.map { |other_pt| get_distance(curr_pt, other_pt) }
    closest_pt_i = distances.index(distances.min)
    # pp pt_i
    # pp i
    # pp '~' * 20
    pt_i_adj = closest_pt_i + curr_pt_i + 1

    existing_circuit_index = find_existing_circuit(curr_pt_i)
    if existing_circuit_index
      add_to_existing_circuit(pt_i_adj, existing_circuit_index)
    else
      create_new_circuit(curr_pt_i, pt_i_adj)
    end
  end

  pp @circuits
  circuit_sizes = @circuits.map(&:size)
  sorted_circuit_sizes = circuit_sizes.sort.reverse
  pp sorted_circuit_sizes
  sorted_circuit_sizes[0] * sorted_circuit_sizes[1] * sorted_circuit_sizes[2]
end

pp main




# [
# [0]
# [1]
# [2]
# [3]
# ]

# [
#   [0,1]
#   [2,3]
# ]

# [
#   [0,1,2,3]
# ]


# pairs = [
#   {
#     [0,1]
#     5
#   }
#   {
#     [0,2]
#     10
#   }
#   ...
#   {
#     [2,3]
#     1
#   }
# ]

# pairs = {
#   [0,1] => 5
#   ...
# }

# pairs = [ [ [0,1], 5 ], ...]

# pairs = []
