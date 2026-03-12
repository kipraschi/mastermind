require_relative 'board'
require_relative 'codemaker'
require_relative 'codebreaker'
class Game
  def initialize(turns = 12, colors = 6)
    @turns = turns
    @turn = 1
    @pegs = 4
    @computer = Codemaker.new
    @board = Board.new(@turns, @pegs)
  end

  def play
    until @turn == @turns
      puts "\nAttempt #{@turn}"
      print_conditions
      begin
        guess = gets.chomp.split("")
        raise unless valid_input(guess)
      rescue
        remind_conditions
        retry
      end
      @board.board[@turn - 1] = guess
      @board.feedback[@turn - 1] = @computer.give_feedback(guess)
      @board.draw
      @turn += 1
    end
  end

  private

  def valid_input(input)
    input.all? { |number| (1..@pegs).include?(number.to_i) } &&
    input.length == @pegs && 
    input.uniq.length == @pegs
  end

  def print_conditions
    puts "Choose #{@pegs} unique numbers from 1 to 6."
    print 'Make your guess: '
  end

  def remind_conditions
    puts "\nNo number can be lower than 1 or higher than 6."
    puts "Code is #{@pegs} digits only. Numbers don't repeat."
    print "Please try again: "
  end

end