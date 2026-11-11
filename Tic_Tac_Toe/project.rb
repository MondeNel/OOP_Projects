# ==========================================
# START GAME
# ==========================================

# 1. SET UP THE BOARD
# Create an array with 9 empty spaces (" ") to represent the 3x3 grid.
# Using Array.new(9, " ") is a clean Ruby way to avoid typing 9 empty strings manually.
board = Array.new(9, ' ')

# 2. SET UP THE PLAYERS
# Ask Player 1 for their name.
# 'print' keeps the cursor on the same line, and '.chomp' removes the Enter key newline.
puts "Enter Player 1's name (you will be X): "
player_1_name = gets.chomp
player_1_symbol = 'X'

# Ask Player 2 for their name.
puts "Enter Player 2's name (you will be O): "
player_2_name = gets.chomp
player_2_symbol = 'O'

# Initialize both players' scores to 0 at the start of the session.
player_1_score = 0
player_2_score = 0

# --- Temporary check to confirm Step 1 works (we will remove this in Step 2) ---
puts "\nSetup complete! #{player_1_name} (#{player_1_symbol}) vs #{player_2_name} (#{player_2_symbol})"
puts "Board ready with #{board.length} spaces."

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
#     Print BOARD[0] | BOARD[1] | BOARD[2]
#     Print ---------
#     Print BOARD[3] | BOARD[4] | BOARD[5]
#     Print ---------
#     Print BOARD[6] | BOARD[7] | BOARD[8]
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
#     IF (BOARD[0] == BOARD[1] == BOARD[2] and not empty) OR
#        (BOARD[3] == BOARD[4] == BOARD[5] and not empty) OR
#        (BOARD[6] == BOARD[7] == BOARD[8] and not empty) OR
#        (BOARD[0] == BOARD[3] == BOARD[6] and not empty) OR
#        (BOARD[1] == BOARD[4] == BOARD[7] and not empty) OR
#        (BOARD[2] == BOARD[5] == BOARD[8] and not empty) OR
#        (BOARD[0] == BOARD[4] == BOARD[8] and not empty) OR
#        (BOARD[2] == BOARD[4] == BOARD[6] and not empty) THEN
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
