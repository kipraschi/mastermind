class Codemaker
  def initialize
    @code = make_code(4)
    puts "Code is #{@code.join}\n " # for testing
  end

  def give_feedback(guess)
    black = 0
    white = 0
    guess.each_with_index do |number, i|
      @code.each_with_index do |peg, j|
        if number.to_i == peg.to_i
          i == j ? black += 1 : white += 1
        else
          next
        end
      end
    end
    "#{white}W#{black}B"
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