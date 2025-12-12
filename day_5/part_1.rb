# frozen_string_literal: true
require 'set'

def get_ranges
  pp Time.now
  fake_ranges = File.read('input.txt').split("=")[0].split("\n").map{|fake_range| fake_range.split("-")}
  pp Time.now
  # TODO: Too big!
  real_ranges = fake_ranges.map{ |fake_range| (fake_range[0].to_i..fake_range[1].to_i).to_a } 
  pp Time.now
  x = real_ranges.flatten.uniq.to_set
  pp Time.now
  return x
end


def get_ingredient_ids
  pp Time.now
  File.read('input.txt').split("=")[1].split("\n").map(&:to_i).to_set
  pp Time.now
end


pp Time.now
def main
  y = (get_ingredient_ids & get_ranges).size
  return y
end
pp main
