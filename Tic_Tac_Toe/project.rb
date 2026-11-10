# tic_tac_toe.rb

# The Board class manages the state and visual representation of the 3x3 grid.
class Board
  # State: The board is represented as an array of 9 elements (flat array).
  # Index 0-8 map to positions on the grid:
  # 1 | 2 | 3
  # ---------
  # 4 | 5 | 6
  # ---------
  # 7 | 8 | 9
  attr_reader :grid

  def initialize
    # Initialize an array of 9 elements, filled with spaces to represent empty slots.
    @grid = Array.new(9, " ")
  end

  # Display the current state of the board in a user-friendly CLI layout.
  def display
    puts "\n"
    puts " #{grid[0]} | #{grid[1]} | #{grid[2]} "
    puts "-----------"
    puts " #{grid[3]} | #{grid[4]} | #{grid[5]} "
    puts "-----------"
    puts " #{grid[6]} | #{grid[7]} | #{grid[8]} "
    puts "\n"
  end
end

# Simple execution block to verify Step 1 works out of the box.
if __FILE__ == $0
  puts "Initializing empty Tic Tac Toe Board..."
  board = Board.new
  board.display
end



# Set the game rules and logic


# Define the game board and its state


# Define the players and their moves


# Define the game flow and turns


# Define the game outcome and winner determination


# Define the game interface and user interaction


# Define the game loop and replay option


# Define the game reset and restart functionality


# Define the game scoring and statistics tracking

