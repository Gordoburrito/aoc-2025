# frozen_string_literal: true

require 'Set'

def get_ranges
  # File.read('input_example.txt').split('=')[0].split("\n").map { |fake_range| fake_range.split('-').map(&:to_i).sort }
  File.read('input.txt').split('=')[0].split("\n").map { |fake_range| fake_range.split('-').map(&:to_i).sort }
  # File.read('input.txt').split('=')[0].split("\n").first(10).map { |fake_range| fake_range.split('-').map(&:to_i).sort }
end

def overlapping?(range, combined_range)
  return true if range.first >= combined_range.first && range.first <= combined_range.last
  return true if range.last >= combined_range.first && range.last <= combined_range.last
  return true if range.first <= combined_range.first && range.last >= combined_range.last

  false
end

def combine_ranges(range, combined_ranges, overlapping_indexes)
  arr = [range]
  overlapping_indexes.each do |i|
    arr << combined_ranges[i]
  end
  arr.flatten.minmax
end

def main
  ranges = get_ranges

  # pp "ranges: #{ranges}"

  combined_ranges = [ranges[0]]
  tot = 0

  ranges.each do |range|
    # pp '~' * 10
    overlapping_indexes = []
    # pp "range: #{range}"
    # pp "combined_ranges: #{combined_ranges}"
    combined_ranges.each_with_index do |combined_range, i|
      # pp "combined_range: #{combined_range}"
      # pp "overlapping?: #{overlapping?(range, combined_range)}"

      overlapping_indexes << i if overlapping?(range, combined_range)
    end
    # pp "overlapping_indexes: #{overlapping_indexes}"
    if overlapping_indexes.empty?
      combined_ranges << range
    else
      new_combined_range = combine_ranges(range, combined_ranges, overlapping_indexes)
      combined_ranges = combined_ranges.reject.with_index { |_e, i| overlapping_indexes.include? i }
      combined_ranges << new_combined_range
    end
    # pp "combined ranges: #{combined_ranges}"
  end

  pp combined_ranges.sort_by(&:first)

  combined_ranges.each do |range|
    tot += (range.last - range.first + 1)
  end

  tot
end

pp main

# 307480711546534
# 290847923057404
# 350939902751909

# 350939902751909
