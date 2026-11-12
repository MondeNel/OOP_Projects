# frozen_string_literal: true

require_relative 'player'
require_relative 'board'

# The game runs rounds and keeps track of whose turn it is.
class Game
  def initialize
    @board = Board.new
    @player1 = make_player(1, 'X')
    @player2 = make_player(2, 'O')
  end

  def start
    loop do
      play_round
      show_score
      break unless play_again?
    end

    puts 'Thanks for playing! Goodbye!'
  end

  private

  def make_player(number, symbol)
    print "Enter Player #{number}'s name (#{symbol}): "
    name = gets.chomp
    Player.new(name, symbol)
  end

  def play_round
    @board.reset
    current_player = @player1

    loop do
      @board.display
      take_turn(current_player)

      if @board.winner?(current_player.symbol)
        @board.display
        puts "#{current_player.name} wins this round!"
        current_player.add_win
        break
      elsif @board.full?
        @board.display
        puts "It's a tie game!"
        break
      end

      current_player = other_player(current_player)
    end
  end

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

  def other_player(player)
    if player == @player1
      @player2
    else
      @player1
    end
  end

  def show_score
    puts "\n=== SCORE ==="
    puts "#{@player1.name}: #{@player1.score}"
    puts "#{@player2.name}: #{@player2.score}\n\n"
  end

  def play_again?
    print 'Play another round? (y/n): '
    gets.chomp.downcase == 'y'
  end
end

Game.new.start
