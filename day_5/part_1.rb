# frozen_string_literal: true

def get_ranges
  fake_ranges = File.read('input.txt').split('=')[0].split("\n").map { |fake_range| fake_range.split('-') }
  fake_ranges.map { |fake_range| (fake_range[0].to_i..fake_range[1].to_i) }
end

def get_ingredient_ids
  File.read('input.txt').split('=')[1].split("\n").map(&:to_i)
end

def main
  ranges = get_ranges
  ingredient_ids = get_ingredient_ids
  fresh_ingredient_ids = []

  ingredient_ids.each do |ingredient_id|
    ranges.each do |range|
      if range.include?(ingredient_id) && !fresh_ingredient_ids.include?(ingredient_id)
        fresh_ingredient_ids << ingredient_id
      end
    end
  end

  fresh_ingredient_ids.size
end

pp main
