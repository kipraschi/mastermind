module InputValidation

  def get_valid_input
    begin
      input = gets.chomp.split('')
      errors = input_errors(input)
      raise "Invalid Input" unless errors.empty?
    rescue
      remind_conditions(errors)
      retry
    end
    input
  end
  
  private

  def input_errors(input)
    errors = {}

    unless input.all? { |number| (1..@colors).include?(number.to_i) }
      errors[:range] =  "Code can only contain numbers no lower than 1 and no higher than #{@colors}."
    end
    if input.length != @pegs
      errors[:length] = "Code should be #{@pegs} digits."
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

end