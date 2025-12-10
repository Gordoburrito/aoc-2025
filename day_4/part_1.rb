# frozen_string_literal: true

def get_stuff
  File.read('input_example.txt').split("\n")
  # File.read('input.txt').split("\n")
end

def main
  stuff = get_stuff
end

main
