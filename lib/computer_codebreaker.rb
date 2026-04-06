require_relative 'feedback'

class ComputerCodebreaker
  include Feedback

  def initialize(board)
    @board = board
    @possible_codes = (1..@board.colors).to_a.permutation(@board.pegs).map { |arr| arr}
    @turn = 1
  end

  def guess
    code = @turn == 1 ? (1..@board.pegs).to_a : reduce_posibilities(@turn).first
    @turn += 1
    code
  end

  private

  def reduce_posibilities(turn) 
    last_guess = @board.board[turn - 2]
    last_feedback = @board.feedback[turn - 2]

    @possible_codes.filter! do |candidate|
      give_feedback(last_guess, candidate) == last_feedback
    end

    @possible_codes
  end
end