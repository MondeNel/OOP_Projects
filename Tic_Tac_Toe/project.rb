# CLASS Board
#     PROPERTIES
#         grid: Array of 9 spaces (indices 0 to 8)
#
#     METHOD initialize()
#         Set grid to [ " ", " ", " ", " ", " ", " ", " ", " ", " " ]
#     END METHOD
#
#     METHOD display()
#         Print grid rows separated by "|" and "-----------" lines
#     END METHOD
#
#     METHOD update_position(position, symbol)
#         IF position is valid AND position is empty THEN
#             grid[position] = symbol
#             RETURN true
#         ELSE
#             RETURN false
#         END IF
#     END METHOD
#
#     METHOD is_full()
#         RETURN true IF grid contains no empty spaces, ELSE false
#     END METHOD
#
#     METHOD check_winner()
#         Define winning combinations (rows, columns, diagonals)
#         FOR EACH combination
#             IF grid matching combination elements are all equal AND not empty THEN
#                 RETURN the winning symbol
#             END IF
#         END FOR
#         RETURN null
#     END METHOD
# END CLASS
#
# CLASS Player
#     PROPERTIES
#         name: String
#         symbol: String ("X" or "O")
#         score: Integer
#
#     METHOD initialize(name, symbol)
#         Set name, symbol, and set score to 0
#     END METHOD
# END CLASS
#
# CLASS Game
#     PROPERTIES
#         board: Board Instance
#         player1: Player Instance
#         player2: Player Instance
#         current_player: Player Instance
#
#     METHOD initialize()
#         Get player details from user input
#         Create player1 and player2
#         Set current_player to player1
#         Create new Board
#     END METHOD
#
#     METHOD switch_turn()
#         IF current_player is player1 THEN
#             current_player = player2
#         ELSE
#             current_player = player1
#         END IF
#     END METHOD
#
#     METHOD play_turn()
#         LOOP
#             Display board
#             Prompt current_player for a move (1-9)
#             Convert input to array index (0-8)
#             IF board.update_position(index, current_player.symbol) THEN
#                 EXIT LOOP
#             ELSE
#                 Print "Invalid move. Slot taken or out of bounds."
#             END IF
#         END LOOP
#     END METHOD
#
#     METHOD start_game_loop()
#         LOOP (Game Reset Loop)
#             Reset board
#             LOOP (Turn Loop)
#                 play_turn()
#
#                 IF board.check_winner() is not null THEN
#                     Display board
#                     Print current_player.name + " wins!"
#                     Increment current_player.score
#                     EXIT LOOP (Turn Loop)
#                 END IF
#
#                 IF board.is_full() THEN
#                     Display board
#                     Print "It's a tie!"
#                     EXIT LOOP (Turn Loop)
#                 END IF
#
#                 switch_turn()
#             END LOOP
#
#             Print overall scores and statistics
#             Prompt user: "Play again? (y/n)"
#             IF user answers "no" THEN
#                 Print "Thanks for playing!"
#                 EXIT LOOP (Game Reset Loop)
#             END IF
#         END LOOP
#     END METHOD
# END CLASS
