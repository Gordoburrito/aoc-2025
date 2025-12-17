# frozen_string_literal: true

require 'Set'

def get_ranges
  File.read('input.txt').split('=')[0].split("\n").map { |fake_range| fake_range.split('-').map(&:to_i).sort }
end

def overlapping?(range, combined_range)
  return true if range.first >= combined_range.first && range.first <= combined_range.last

  return true if range.last >= combined_range.first && range.last <= combined_range.last

  false
end

def expand_range(_range, combined_ranges, overlapping_indexes)
  arr = []
  overlapping_indexes.each do |i|
    arr << combined_ranges[i]
  end
  arr.flatten.minmax
end

def main
  ranges = get_ranges

  pp "RANGER DANGER: #{ranges}"
  combined_ranges = [ranges[0]]
  tot = 0

  ranges.each do |range|
    overlapping_indexes = []
    combined_ranges.each_with_index do |combined_range, i|
      overlapping_indexes << i if overlapping?(range, combined_range)
    end
    if overlapping_indexes.empty?
      combined_ranges << range
    else
      overlapping_combined_range = expand_range(range, combined_ranges, overlapping_indexes)
      combined_ranges = combined_ranges.reject.with_index { |_e, i| overlapping_indexes.include? i }
      combined_ranges << overlapping_combined_range
      pp "COMBINED COMBINE: #{combined_ranges}"
    end
  end

  combined_ranges.each do |range|
    tot += (range.last - range.first + 1)
  end

  tot
end

pp main
