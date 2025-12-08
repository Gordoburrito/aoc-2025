# frozen_string_literal: true

def is_valid?(num)
  return true if num.to_s.length.odd?

  str = num.to_s
  half = str.length / 2
  return false if str[0..half-1] == str[half..]

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