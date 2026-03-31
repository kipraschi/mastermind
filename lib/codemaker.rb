require_relative 'feedback'
class Codemaker
  include Feedback
  def initialize
    @code = make_code(4)
    puts "Code is #{@code.join}\n " # for testing
  end

  def give_feedback(guess)
    super(guess, @code)
  end

  private 

  def make_code(pegs)
    array = []
    pegs.times do |i|
      array[i] = rand(1..6)
      redo if array[0..i].uniq.length == i
    end
    array
  end
end