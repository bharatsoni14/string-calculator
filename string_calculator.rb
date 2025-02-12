class StringCalculator
  attr_reader :called_count

  # Initialize the method
  # called_count 0 (used to count the number of times the add method is called)
  def initialize
    @called_count = 0
  end

  # This method takes a string of numbers and returns the sum of those numbers
  def add(string_numbers)
    @called_count += 1
    return 0 if string_numbers.empty?

    # Check if the string has a custom delimiter
    if string_numbers.start_with?("//")
      delimiter, string_numbers = string_numbers.split("\n", 2)
      delimiter = delimiter[2..-1]
      if delimiter.start_with?("[") && delimiter.end_with?("]")
        delimiters = delimiter.scan(/\[([^\]]+)\]/).flatten
      else
        delimiters = [delimiter]
      end
    else
      delimiters = [","]
    end

    # Create a regex pattern to split by multiple delimiters and new line character
    delimiter_pattern = delimiters.map { |d| Regexp.escape(d) }.join("|")
    numbers = string_numbers.split(/#{delimiter_pattern}|\n/)

    # Check if the string has negative numbers
    # Share the negative numbers in exception message comma separated
    negatives = numbers.select { |number| number.to_i < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    # Ignore the numbers greater than 1000
    numbers = numbers.select { |number| number.to_i <= 1000 }

    # Convert the string numbers to integers and sum them
    numbers.map(&:to_i).reduce(:+)
  end

end

