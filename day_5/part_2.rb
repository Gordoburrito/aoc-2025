# frozen_string_literal: true

require 'Set'

def get_ranges
  File.read('input.txt').split('=')[0].split("\n").map { |fake_range| fake_range.split('-').map(&:to_i).sort }.sort_by(&:first)
end

def overlapping?(last_combined, range)
  last_combined.last >= range.first
  # overlapping
  # lc -----
  # r    ------

  # still works
  # lc -------------------
  # r1       -----
  # r2            ------

  # not overlapping
  # lc---
  # r     -----
end

def expand_range(_range, combined_ranges, overlapping_indexes)
end

def main
  ranges = get_ranges
  # pseudo
  # sort the ranges
  # sort by first
  combined_ranges = [ranges[0]]
  ranges[1..].each do |range|
    last_combined = combined_ranges.last
    pp combined_ranges.last
    if overlapping?(combined_ranges.last, range)
      # last_combined = [last_combined.first, [last_combined.last, range.last].max]
      combined_ranges[-1] = (last_combined + range).minmax
      # combined_ranges = (combined_ranges.last + range).minmax
    else
      combined_ranges << range
    end
  end
  pp combined_ranges

  total = 0
  combined_ranges.each do |cr|
    total += cr.last - cr.first + 1
  end

  return total
end

pp main
