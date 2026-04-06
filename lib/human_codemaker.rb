require_relative 'codemaker'
require_relative 'input_validation'

class HumanCodemaker < Codemaker

  include InputValidation

  def initialize(board)
    super
    puts 'You are the Codemaker.'
  end

  private

  def create_code
    print_conditions
    print 'Your secret code: '
    get_valid_input
  end
  
  def print_conditions
    puts "Choose #{@pegs} unique numbers from 1 to #{@colors}."
  end

end