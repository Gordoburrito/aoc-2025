
# each row give me the thing at the index
# concat the thing in the next one

# # iterate through and next time you get a symbol and
# get nothing and then you go to the next one

# or go until you get the next symbol

# get each index of the symbol
# at index 4 is where I break

# go through each row grab the value and stick them together as a number
# and do that for each column

# and then do the operation on those

# frozen_string_literal: true

def get_strings
  nums_and_ops = File.read('input.txt').split("\n") # may need to pad the end. or split to array but keep spaces
  nums = nums_and_ops[0...-1]
  padded_nums = pad_nums(nums)
  ops = nums_and_ops.last.split('')
  [padded_nums, ops]
  # note ... may be an edge case where there's a blank in the middle of a number??? prob not
end

def pad_nums(nums)
  max_length = nums.map(&:length).max
  nums_new = []

  nums.each do |num_str|
    pad_amt = max_length - num_str.length
    if !pad_amt.zero?
      pad_amt.times do |_i|
        num_str = num_str + ' '
      end
    end
    nums_new << num_str
  end

  nums_new
end

def get_op_indexes(operations)
  op_indexes = []

  operations.each_with_index do |op_symbol, index|
    op_indexes << index if op_symbol != ' '
  end

  op_indexes
end

def get_numbers(numbers, start_i, end_i)
  # pp numbers
  # pp start_i
  # pp end_i
  # pp '~' * 20

  result = []

  (start_i..end_i).each do |i|
    # pp i
    str = ''
    numbers.each do |num_str|
      # pp num_str
      str += num_str[i]
    end
    result << str.to_i
  end
  # pp '~' * 20
  result
end

def get_local_val(op, numbers_aaaa)
  if op == '+'
    result = numbers_aaaa.sum
  else
    result = numbers_aaaa.reduce(1, :*)
  end

  result
end

def main
  tot = 0
  numbers, operations = get_strings

  # pp numbers
  # pp operations

  op_indexes = get_op_indexes(operations)

  # pp op_indexes
  # pp op_indexes.length

  # [0, 4, ...]

  # loop op indexes / each block of numbers
  # grab the number column string things
  # do the operation
  # store the value

  op_indexes.each_with_index do |op_index, i|
    # get the actual op
    op = operations[op_index]

    # get the index at the end of the number block
    # TODO deal with end of array
    if i < (op_indexes.length - 1)
      end_i = op_indexes[i + 1] - 2
    else
      end_i = numbers.first.length - 1
    end

    # pp op, end_i
    # *, 2

    numbers_aaaa = get_numbers(numbers, op_index, end_i)

    # pp 'numbers_aaaa'
    # pp numbers_aaaa

    # # ['1', '24', '356']

    local_val = get_local_val(op, numbers_aaaa)

    # pp local_val

    tot += local_val
  end

  tot
end

pp  main
