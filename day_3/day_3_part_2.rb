# frozen_string_literal: true

def get_batteries
  # File.read('day-3-pt1-example.txt').split("\n")
  File.read('day-3.txt').split("\n")
end

def get_stuff(arr, place, accum)
  arr_exclude_last = arr[0..-place]

  first_digit = arr_exclude_last.max
  accum << first_digit

  index_of_first = arr.index(first_digit)
  arr_after_first = arr[(index_of_first + 1)..-1]

  mapped_accum = accum.map(&:to_s).join('').to_i
  return mapped_accum if place == 1

  get_stuff(arr_after_first, place - 1, accum)
end

def main
  batteries = get_batteries
  tot = 0

  batteries.each do |battery|
    arr = battery.split('').map(&:to_i)
    place = 12

    tot += get_stuff(arr, place, [])
  end

  tot
end

pp main
