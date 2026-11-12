# frozen_string_literal: true

# ==========================================
# PLAYER CLASS
# ==========================================
# Responsible only for storing a player's data and managing their score.
class Player
  attr_reader :name, :symbol, :score

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
  end

  # Increases the player's score by 1 when they win a round.
  def increment_score
    @score += 1
  end
end

# ==========================================
# BOARD CLASS
# ==========================================
# Responsible only for managing and displaying the 3x3 grid state.
class Board
  # All 8 possible winning combinations (3 rows, 3 columns, 2 diagonals).
  WINNING_LINES = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8], # Rows
    [0, 3, 6], [1, 4, 7], [2, 5, 8], # Columns
    [0, 4, 8], [2, 4, 6] # Diagonals
  ].freeze

  def initialize
    reset
  end

  # Sets or clears all 9 spaces on the board to empty strings.
  def reset
    @spaces = Array.new(9, ' ')
  end

  # Prints the current 3x3 grid layout to the terminal.
  def display
    puts "\n #{@spaces.at(0)} | #{@spaces.at(1)} | #{@spaces.at(2)} "
    puts '-----------'
    puts " #{@spaces.at(3)} | #{@spaces.at(4)} | #{@spaces.at(5)} "
    puts '-----------'
    puts " #{@spaces.at(6)} | #{@spaces.at(7)} | #{@spaces.at(8)} \n\n"
  end

  # Checks that the chosen index is on the board (0-8) and currently empty.
  def valid_move?(index)
    index.between?(0, 8) && @spaces[index] == ' '
  end

  # Places the player's symbol ('X' or 'O') onto the chosen board space.
  def place_mark(index, symbol)
    @spaces[index] = symbol
  end

  # Returns true if any winning line is completely filled with the given symbol.
  def winner?(symbol)
    WINNING_LINES.any? do |line|
      line.all? { |index| @spaces[index] == symbol }
    end
  end

  # Returns true if there are no empty spaces left on the board.
  def full?
    !@spaces.include?(' ')
  end
end

# ==========================================
# GAME CLASS
# ==========================================
# Coordinates the players, the board, and the overall game loops.
class Game
  def initialize
    # 1. SET UP THE BOARD
    @board = Board.new

    # 2. SET UP THE PLAYERS
    @player1 = create_player(1, 'X')
    @player2 = create_player(2, 'O')
  end

  def start
    # 3. MASTER GAME LOOP (For replays)
    loop do
      reset_round
      play_round

      # ==========================================
      # REMAINING ROADMAP (PSEUDOCODE)
      # ==========================================

      #   // 5. SCOREBOARD & REPLAY CHECK
      #   Print "=== CURRENT SCOREBOARD ==="
      #   Print Player 1's name + ": " + PLAYER_1_SCORE
      #   Print Player 2's name + ": " + PLAYER_2_SCORE

      break unless play_again?
    end

    puts 'Thanks for playing! Goodbye!'
  end

  private

  # Helper method kept private so only the Game class uses it during setup.
  def create_player(number, symbol)
    print "Enter Player #{number}'s name (you will be #{symbol}): "
    name = gets.chomp
    Player.new(name, symbol)
  end

  # Resets the board and turn tracking at the beginning of every match.
  def reset_round
    @board.reset
    @current_player = @player1
    @game_over = false
  end

  # 4. MATCH TURN LOOP (For playing a single round)
  def play_round
    until @game_over
      @board.display
      take_turn
      evaluate_turn
    end
  end

  # Prompts the current player until they enter a valid, open spot (1-9).
  def take_turn
    loop do
      print "#{@current_player.name} (#{@current_player.symbol}), pick a spot (1-9): "
      index = gets.chomp.to_i - 1

      if @board.valid_move?(index)
        @board.place_mark(index, @current_player.symbol)
        break
      end

      puts 'Oops! That spot is taken or invalid. Try again.'
    end
  end

  # Checks for a win or tie after a move; switches turns if the round continues.
  def evaluate_turn
    if @board.winner?(@current_player.symbol)
      handle_win
    elsif @board.full?
      handle_tie
    else
      switch_turn
    end
  end

  # Announces the round winner, updates their score, and ends the current round.
  def handle_win
    @board.display
    puts "#{@current_player.name} wins this round!"
    @current_player.increment_score
    @game_over = true
  end

  # Announces a tie game and ends the current round.
  def handle_tie
    @board.display
    puts "It's a tie game!"
    @game_over = true
  end

  # Alternates the active player between Player 1 and Player 2.
  def switch_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  # Prompts players to decide if they want to play another round.
  def play_again?
    print 'Do you want to play another match? (y/n): '
    gets.chomp.downcase == 'y'
  end
end

# ==========================================
# START GAME
# ==========================================
game = Game.new
game.start
