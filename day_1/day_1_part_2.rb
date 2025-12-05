# frozen_string_literal: true

def normalize_instructions(instructions)
  instructions.map do |instruction|
    sign = instruction[0] == 'R' ? 1 : -1
    sign * instruction[1..].to_i
  end
end

def main
  position = 50
  count = 0
  instructions = normalize_instructions(File.read('day-1.txt').split("\n"))
  instructions.each do |instruction|
    instruction.abs.times do |_tick|
      tick = instruction.positive? ? 1 : -1
      raw_position = position + tick
      position = raw_position % 100
      count += 1 if position.zero?
    end
  end
  count
end

pp main
