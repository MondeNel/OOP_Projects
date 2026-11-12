# frozen_string_literal: true

# A player has a name, a symbol, and a score.
class Player
  attr_reader :name, :symbol, :score

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
  end

  def add_win
    @score += 1
  end
end
