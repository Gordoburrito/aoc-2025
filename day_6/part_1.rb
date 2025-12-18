# frozen_string_literal: true

def get_problems
  nums_and_ops = File.read('input.txt').split("\n").map{|row| row.split(" ")}
  nums = nums_and_ops[0...-1].map{|row| row.map(&:to_i)}
  ops = nums_and_ops.last
  [nums, ops]
end
# [["123 328  51 64 ", " 45 64  387 23 ", "  6 98  215 314"], "*   +   *   +  "]


def main
  numbers, operations = get_problems
  sum = 0

  puts "numbers, operations #{numbers}, #{operations}"
  operations.each_with_index do |op_symbol, i|
    
    if (op_symbol == "+")
      local_val = 0
      numbers.each do |num_row|
        local_val += num_row[i]
      end
      pp "+: #{local_val}"
    end
    
    if (op_symbol == "*")
      local_val = 1
      numbers.each do |num_row|
        local_val = local_val * num_row[i]
      end
      pp "*: #{local_val}"
    end
    sum += local_val
  end
  return sum
end

pp main