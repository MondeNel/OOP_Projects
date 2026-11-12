# frozen_string_literal: true

# The board stores and displays the nine spaces in the game.
class Board
  WINNING_LINES = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize
    reset
  end

  def reset
    @spaces = Array.new(9, ' ')
  end

  def display
    puts "\n #{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]}"
    puts '---+---+---'
    puts " #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]}"
    puts '---+---+---'
    puts " #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]}\n\n"
  end

  def valid_move?(number)
    number >= 1 && number <= 9 && @spaces[number - 1] == ' '
  end

  def place_mark(number, symbol)
    @spaces[number - 1] = symbol
  end

  def winner?(symbol)
    WINNING_LINES.any? do |line|
      line.all? { |position| @spaces[position] == symbol }
    end
  end

  def full?
    !@spaces.include?(' ')
  end
end
