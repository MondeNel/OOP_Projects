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
# Responsible only for managing the 3x3 grid state.
class Board
  attr_reader :spaces

  def initialize
    reset
  end

  # Sets or clears all 9 spaces on the board to empty strings.
  def reset
    @spaces = Array.new(9, ' ')
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
    # --- Temporary check to confirm Step 1 OOP setup works ---
    puts "\nSetup complete! #{@player1.name} (#{@player1.symbol}) vs #{@player2.name} (#{@player2.symbol})"
    puts "Starting Score: #{@player1.score} - #{@player2.score}"
    puts "Board ready with #{@board.spaces.length} spaces."

    # ==========================================
    # REMAINING ROADMAP (PSEUDOCODE)
    # ==========================================

    # // 3. MASTER GAME LOOP (For replays)
    # LOOP REPLAY_LOOP
    #   Clear the BOARD (make all 9 spaces empty again)
    #   Set CURRENT_PLAYER to Player 1
    #   Set GAME_OVER to false
    #
    #   // 4. MATCH TURN LOOP (For playing a single round)
    #   LOOP MATCH_LOOP WHILE GAME_OVER IS FALSE
    #
    #     // Print the board layout to the screen
    #     Print BOARD | BOARD | BOARD
    #     Print ---------
    #     Print BOARD | BOARD | BOARD
    #     Print ---------
    #     Print BOARD | BOARD | BOARD
    #
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
    #       Print CURRENT_PLAYER's name + " wins this round! 🎉"
    #       Increment CURRENT_PLAYER's score by 1
    #       Set GAME_OVER to true
    #       EXIT MATCH_LOOP
    #     END IF
    #
    #     // Check for a tie
    #     IF BOARD has no empty spaces left THEN
    #       Print "It's a tie game! 🤝"
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
    #
    #   END LOOP
    #
    #   // 5. SCOREBOARD & REPLAY CHECK
    #   Print "=== CURRENT SCOREBOARD ==="
    #   Print Player 1's name + ": " + PLAYER_1_SCORE
    #   Print Player 2's name + ": " + PLAYER_2_SCORE
    #
    #   Print "Do you want to play another match? (y/n): "
    #   Read PLAY_AGAIN_INPUT
    #
    #   IF PLAY_AGAIN_INPUT is NOT "y" THEN
    #     Print "Thanks for playing! Goodbye!"
    #     EXIT REPLAY_LOOP
    #   END IF
    #
    # END LOOP
    #
    # END GAME
  end

  private

  # Helper method kept private so only the Game class uses it during setup.
  def create_player(number, symbol)
    print "Enter Player #{number}'s name (you will be #{symbol}): "
    name = gets.chomp
    Player.new(name, symbol)
  end
end

# ==========================================
# START GAME
# ==========================================
game = Game.new
game.start
