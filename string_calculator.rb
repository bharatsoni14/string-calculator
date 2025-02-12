class StringCalculator

  # This method takes a string of numbers and returns the sum of those numbers
  def add(numbers)
    return 0 if numbers.empty?

    numbers.split(',').map(&:to_i).sum
  end
end