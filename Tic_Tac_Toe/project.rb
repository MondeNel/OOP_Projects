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
end

# ==========================================
# BOARD CLASS
# ==========================================
# Responsible only for managing and displaying the 3x3 grid state.
class Board
  attr_reader :spaces

  def initialize
    reset
  end

  # Sets or clears all 9 spaces on the board to empty strings.
  def reset
    @spaces = Array.new(9, ' ')
  end

  # Prints the current 3x3 grid layout to the terminal.
  def display
    puts "\n #{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]} "
    puts '-----------'
    puts " #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]} "
    puts '-----------'
    puts " #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]} \n\n"
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
      # Print the board layout to the screen
      @board.display

      # ==========================================
      # REMAINING ROADMAP (PSEUDOCODE)
      # ==========================================

      #     // Get a valid move from the current player
      #     LOOP INPUT_LOOP
      #       Print CURRENT_PLAYER's name + ", pick a spot (1-9): "
      #       Read USER_INPUT
      #       Convert USER_INPUT to a number index (Subtract 1 to match 0-8 tracking)
      #
      #       IF index is between 0 and 8 AND BOARD[index] is empty THEN
      #         BOARD[index] = CURRENT_PLAYER's symbol
      #         EXIT INPUT_LOOP
      #       ELSE
      #         Print "Oops! That spot is taken or invalid. Try again."
      #       END IF
      #     END LOOP
      #
      #     // Check for a winner (All 8 possible matching lines)
      #     IF (BOARD == BOARD == BOARD and not empty) OR
      #        (BOARD == BOARD == BOARD and not empty) OR
      #        (BOARD == BOARD == BOARD and not empty) OR
      #        (BOARD == BOARD == BOARD and not empty) OR
      #        (BOARD == BOARD == BOARD and not empty) OR
      #        (BOARD == BOARD == BOARD and not empty) OR
      #        (BOARD == BOARD == BOARD and not empty) OR
      #        (BOARD == BOARD == BOARD and not empty) THEN
      #
      #       Print CURRENT_PLAYER's name + " wins this round!"
      #       Increment CURRENT_PLAYER's score by 1
      #       Set GAME_OVER to true
      #       EXIT MATCH_LOOP
      #     END IF
      #
      #     // Check for a tie
      #     IF BOARD has no empty spaces left THEN
      #       Print "It's a tie game!"
      #       Set GAME_OVER to true
      #       EXIT MATCH_LOOP
      #     END IF
      #
      #     // Switch turns if the game is still going
      #     IF CURRENT_PLAYER is Player 1 THEN
      #       CURRENT_PLAYER = Player 2
      #     ELSE
      #       CURRENT_PLAYER = Player 1
      #     END IF

      # --- Temporary exit check so the match loop doesn't run forever yet ---
      print 'End this test round? (y/n): '
      @game_over = true if gets.chomp.downcase == 'y'
    end
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
