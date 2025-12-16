# frozen_string_literal: true

require 'Set'

def get_ranges
  File.read('input_example.txt').split('=')[0].split("\n").map { |fake_range| fake_range.split('-').map(&:to_i) }
end

def overlapping?(range, combined_range)
  return true if range.first >= combined_range.first && range.first <= combined_range.last

  return true if range.last >= combined_range.first && range.last <= combined_range.last

  false
end

def expand_range(range, combined_range)
  arr = range + combined_range
  arr.minmax
end

def main
  ranges = get_ranges
  combined_ranges = [ranges[0]]
  tot = 0

  ranges.each do |range|
    pp range
    combined_ranges.each_with_index do |combined_range, i|
      pp combined_range
      pp overlapping?(range, combined_range)
      if overlapping?(range, combined_range)
        combined_ranges[i] = expand_range(range, combined_range)
      else
        combined_ranges << range
      end
      pp '~' * 10
    end
  end

  pp combined_ranges

  combined_ranges.each do |range|
    tot += (range.last - range.first + 1)
  end

  tot
end

pp main
