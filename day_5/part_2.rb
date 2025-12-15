# frozen_string_literal: true

require 'Set'

def get_ranges
  File.read('input_example.txt').split('=')[0].split("\n").map { |fake_range| fake_range.split('-').map(&:to_i) }
end

def overlapping?(a, b)
  # [1, 7], [5, 9]
  a[0]
end

def recurse_merge(a)
  # go through remaining until no changes
end

def main
  ranges = get_ranges
  sorted_ranges = sort_ranges

  recurse_merge(a)

  sorted_ranges.each_with_index do |a, i|
    sorted_ranges[i..-1].each do |b|
      if overlapping?(a, b)
        merge(a, b)
      end
    end
  end
  pp ranges
end

main
