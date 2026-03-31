require_relative 'feedback'
class Codebreaker
  include Feedback

  def initialize(board)
    @board = board
    @possible_codes = [1, 2, 3, 4, 5, 6].permutation(4).map { |arr| arr} # needs scaling
  end

  def input_guess
    gets.chomp.split('')
  end

  def generate_guess(turn)
    turn == 1 ? [1, 2, 3, 4] : reduce_posibilities(turn).first
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