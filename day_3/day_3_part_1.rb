# frozen_string_literal: true

# max value with index
# - exclude the last digit
# split at index
# max in second half

def get_batteries
  # File.read('day-3-pt1-example.txt').split("\n")
  File.read('day-3.txt').split("\n")
end

def main
  batteries = get_batteries
  tot = 0

  batteries.each do |battery|
    a = battery.split('').map(&:to_i)
    a_exclude_last = a[0..-2]

    first_digit = a_exclude_last.max
    index_of_first = a.index(first_digit)

    a_after_first = a[(index_of_first + 1)..-1]
    second_digit = a_after_first.max

    ans = first_digit * 10 + second_digit
    tot += ans
  end

  tot
end

pp main
# ["987654321111111", "811111111111119", "234234234234278", "818181911112111"]
