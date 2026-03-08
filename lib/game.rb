require_relative 'board'
class Game
  def initialize(turns = 12, colors = 6)
    @turns = turns
    @board = Board.new(@turns, 4)
  end

  def play
    @board.draw
  end

end