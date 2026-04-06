require_relative 'input_validation'
class HumanCodebreaker

  include InputValidation

  def initialize(board)
    @pegs = board.pegs
    @colors = board.colors
    puts 'You are the Codebreaker.'
  end

  def guess
    print_conditions
    print 'Make your guess: '
    get_valid_input
  end

  private 

  def print_conditions
      puts "Choose #{@pegs} unique numbers from 1 to #{@colors}."
  end

end