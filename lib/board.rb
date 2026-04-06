class Board
  attr_accessor :feedback, :board

  def initialize(rows, cols)
    @board = Array.new(rows) { Array.new(cols, "*") }
    @feedback = Array.new(rows)
  end

  attr_accessor :pegs, :colors

  def update(turn, guess, feedback)
    @board[turn - 1] = guess
    @feedback[turn - 1] = feedback
    draw
  end

  private

  def draw
    puts "\n"
    @board.each_with_index do |row, index| 
      print "#{(index + 1).to_s.rjust(2, '0')}: #{row.join (' ')}"
      unless @feedback[index].nil? 
        puts " | Feedback: #{@feedback[index]}" 
      else
        print "\n"
      end
    end
    puts "\n"
  end

end