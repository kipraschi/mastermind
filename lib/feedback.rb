module Feedback
  def give_feedback(guess, code)
    black = 0
    white = 0
    guess.each_with_index do |number, i|
      code.each_with_index do |peg, j|
        if number.to_i == peg.to_i
          i == j ? black += 1 : white += 1
        else
          next
        end
      end
    end
    "#{white}W#{black}B"
  end
end