require_relative 'feedback'
class Codemaker
  include Feedback

  def initialize(board)
    @pegs = board.pegs
    @colors = board.colors
    @code = create_code
  end

  def give_feedback(guess)
    super(guess, @code)
  end

end
