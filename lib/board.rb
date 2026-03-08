class Board
  
  def initialize(rows, cols)
    @board = Array.new(rows) { Array.new(cols, "*") }
    @feedback = Array.new(rows)
  end

  def draw
    @board.each_with_index do |row, index| 
      print "#{(index + 1).to_s.rjust(2, '0')}: #{row.join (' ')}"
      unless @feedback[index].nil? 
        puts " | Feedback: #{@feedback[index]}" 
      else
        print "\n"
      end
    end
  end

end