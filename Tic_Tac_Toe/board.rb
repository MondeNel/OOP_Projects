# frozen_string_literal: true

# Stores and displays the board.
class Board
  WINNING_LINES = [
    # Three rows
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],

    # Three columns
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],

    # Two diagonals
    [0, 4, 8], # Top-left to bottom-right
    [2, 4, 6]  # Top-right to bottom-left
  ].freeze

  def initialize
    reset
  end

  # Creates nine empty spaces.
  def reset
    @spaces = Array.new(9, ' ')
  end

  # Prints the board.
  def display
    puts "\n #{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]}"
    puts '---+---+---'
    puts " #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]}"
    puts '---+---+---'
    puts " #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]}\n\n"
  end

  # Checks that the chosen space (1-9) is open.
  def valid_move?(number)
    number >= 1 && number <= 9 && @spaces[number - 1] == ' '
  end

  # Places a symbol in the chosen space.
  def place_mark(number, symbol)
    @spaces[number - 1] = symbol
  end

  # Checks if the symbol has a winning line.
  def winner?(symbol)
    WINNING_LINES.any? do |line|
      line.all? { |position| @spaces[position] == symbol }
    end
  end

  # Checks if every space is filled.
  def full?
    !@spaces.include?(' ')
  end
end
