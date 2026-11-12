# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# Runs the game and keeps score.
class Game
  # Sets up the board and players.
  def initialize
    @board = Board.new
    @player1 = make_player(1, 'X')
    @player2 = make_player(2, 'O')
  end

  # Plays rounds until the players stop.
  def start
    loop do
      play_round
      show_score
      break unless play_again?
    end

    puts 'Thanks for playing! Goodbye!'
  end

  private

  # Creates a player with a name and symbol.
  def make_player(number, symbol)
    print "Enter Player #{number}'s name (#{symbol}): "
    name = gets.chomp
    Player.new(name, symbol)
  end

  # Plays one round.
  def play_round
    @board.reset
    current_player = @player1

    # Keep taking turns until someone wins or the board is full.
    loop do
      @board.display
      take_turn(current_player)

      break if player_won?(current_player) || game_tied?

      current_player = other_player(current_player)
    end
  end

  # Announces a win and adds a point.
  def player_won?(player)
    return false unless @board.winner?(player.symbol)

    @board.display
    puts "#{player.name} wins this round!"
    player.add_win
    true
  end

  # Announces a tie.
  def game_tied?
    return false unless @board.full?

    @board.display
    puts "It's a tie game!"
    true
  end

  # Gets a valid move from the player.
  def take_turn(player)
    loop do
      print "#{player.name} (#{player.symbol}), pick a spot (1-9): "
      number = gets.chomp.to_i

      if @board.valid_move?(number)
        @board.place_mark(number, player.symbol)
        break
      end

      puts 'That spot is taken or invalid. Try again.'
    end
  end

  # Returns the other player.
  def other_player(player)
    if player == @player1
      @player2
    else
      @player1
    end
  end

  # Prints both players' scores.
  def show_score
    puts "\n=== SCORE ==="
    puts "#{@player1.name}: #{@player1.score}"
    puts "#{@player2.name}: #{@player2.score}\n\n"
  end

  # Asks if the players want another round.
  def play_again?
    print 'Play another round? (y/n): '
    gets.chomp.downcase == 'y'
  end
end

Game.new.start
