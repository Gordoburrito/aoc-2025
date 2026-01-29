# frozen_string_literal: true

def get_manuals
  rows = File.read('input_example.txt').split("\n")
  manuals = []
  rows.each do |row|
    manual = []
    row_array = row.split(' ')
    goal = row_array[0].split('')[1...-1]
    goal.map! do |light|
      light == '.' ? 0 : 1
    end
    manual << goal
    button_strs = row_array[1...-1]
    buttons = []
    button_strs.each do |btn_str|
      buttons << btn_str[1...-1].split(',').map(&:to_i)
    end
    manual << buttons
    manuals << manual
  end
  manuals
end

def main
  manuals = get_manuals

  # create button combo list (1 button)
  # check combos if matches goal
  # if yes, combo.length
  # if no, get combo list adding another btn (2 buttons), and so on
end

pp main
