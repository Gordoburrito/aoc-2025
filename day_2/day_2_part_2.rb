# frozen_string_literal: true

def is_valid?(num)
  str = num.to_s
  i = 0
  while i < (str.length / 2)
    temp = str.split(str[0..i])
    return false if temp.empty?

    i += 1
  end
  true
end

def main
  invalid_sum = 0
  ranges = File.read('day-2.txt').split(',').map { |range| range.split('-').map(&:to_i) }.map { |range| (range[0]..range[1]) }
  ranges.each do |range|
    range.each do |number|
      next if is_valid?(number)

      invalid_sum += number
    end
  end
  invalid_sum
end

pp main