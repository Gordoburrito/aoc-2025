# frozen_string_literal: true

def normalize_instructions(instructions) 
  instructions.map do |instruction|
    sign = instruction[0] == 'R' ? 1 : -1
    sign * instruction[1..].to_i
  end
end

def main
  current = 50
  count = 0
  instructions = normalize_instructions(File.read('day-1.txt').split("\n"))
  instructions.each do |instruction|
    current = (current + instruction) % 100
    count += 1 if current.zero?
  end
  count
end

pp main
