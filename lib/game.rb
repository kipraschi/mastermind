require_relative 'board'
require_relative 'codemaker'
require_relative 'human_codemaker'
require_relative 'computer_codemaker'
require_relative 'human_codebreaker'
require_relative 'computer_codebreaker'

class Game
  def initialize(turns = 12, pegs = 4, colors = 6)
    @turns = turns
    @turn = 1
    @board = Board.new(@turns, pegs)
    @board.pegs = pegs
    @board.colors = colors
    define_roles
  end

  def play
    until game_over
      guess = @codebreaker.guess
      feedback = @codemaker.give_feedback(guess)
      @board.update(@turn, guess, feedback)
      break if code_broken
      @turn += 1
    end
    code_broken ? (puts "Code was broken in #{@turn} turns!") : (puts "Game Over...")
  end

  private

  def define_roles
    human_is_codebreaker = choose_role
    @codemaker = human_is_codebreaker ? ComputerCodemaker.new(@board) : HumanCodemaker.new(@board)
    @codebreaker = human_is_codebreaker ? HumanCodebreaker.new(@board) : ComputerCodebreaker.new(@board)
  end

  def choose_role
    puts 'Would you like to be the Codemaker [m] or Codebreaker [b]?'
    print 'Type m or b to choose your role: '
    loop do 
      human_role = gets.chomp.downcase
      return human_role == "b" if valid_role?(human_role)
      puts 'Invalid.'
      print "Please enter 'm' or 'b': "
    end
  end

  def valid_role?(role)
    role.match?(/\A[mb]\z/i)
  end

  def game_over
    @turn > @turns
  end

  def code_broken
    @board.feedback[@turn - 1] == "0W#{@board.pegs}B"
  end

end