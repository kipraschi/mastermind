require_relative 'codemaker'
class ComputerCodemaker < Codemaker
  private 

  def create_code
    array = []
    @pegs.times do |i|
      array[i] = rand(1..@colors)
      redo if array[0..i].uniq.length == i
    end
    array
  end
end