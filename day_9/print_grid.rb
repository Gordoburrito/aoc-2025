# frozen_string_literal: true

require 'set'

def get_tiles
  File.read('input_example.txt').split("\n").map { |tile| tile.split(',').map(&:to_i) }
end

def print_tiles
  tiles = get_tiles
  tile_set = tiles.to_set

  # Print column headers
  print '    '
  (0..12).each { |col| print format('%4d', col) }
  puts

  (0..12).each do |row|
    # Print row number
    print format('%3d ', row)
    (0..12).each do |col|
      if tile_set.include?([col, row])
        # Red color for hash
        print "\e[31m   #\e[0m"
      else
        print '   .'
      end
    end
    puts
  end
end

print_tiles