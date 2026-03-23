require_relative 'board'
require_relative 'codemaker'
require_relative 'codebreaker'

class Game
  def initialize(turns = 12, pegs = 4, colors = 6)
    @turns = turns
    @turn = 1
    @pegs = pegs
    @colors = colors
    @computer = Codemaker.new
    @player = Codebreaker.new
    @board = Board.new(@turns, @pegs)
  end

  def play
    until game_over
      print_conditions
      guess = get_input
      feedback = @computer.give_feedback(guess)
      @board.update(@turn, guess, feedback)
      break if code_broken
      @turn += 1
    end
    code_broken ? (puts "Code was broken!") : (puts "Game Over...")
  end
  
  private

  def get_input
    begin
      guess = @player.guess
      errors = input_errors(guess)
      raise "Invalid Input" unless errors.empty?
    rescue
      remind_conditions(errors)
      retry
    end
    guess
  end

  def game_over
    @turn > @turns
  end

  def code_broken
    @board.feedback[@turn - 1] == "0W#{@pegs}B"
  end

  def input_errors(input)
    errors = {}

    unless input.all? { |number| (1..@colors).include?(number.to_i) }
      errors[:range] =  "Your guess has to only contain numbers no lower than 1 and no higher than #{@colors}."
    end
    if input.length != @pegs
      errors[:length] = "Code is #{@pegs} digits."
    elsif input.uniq.length != @pegs
      errors[:unique] = "Numbers don't repeat."
    end
    errors
  end

  def remind_conditions(errors)
    puts "\nInput Error:"
    errors.each do |type, msg|
      puts "- #{msg}"
    end
    print "Please try again: "
  end

  def print_conditions
    puts "Choose #{@pegs} unique numbers from 1 to 6."
    print 'Make your guess: '
  end

end