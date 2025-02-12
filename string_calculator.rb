class StringCalculator

  # This method takes a string of numbers and returns the sum of those numbers
  def add(string_numbers)
    return 0 if string_numbers.empty?

    string_numbers.split(',').map(&:to_i).sum
  end
end