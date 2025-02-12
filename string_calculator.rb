class StringCalculator

  # This method takes a string of numbers and returns the sum of those numbers
  def add(string_numbers)
    return 0 if string_numbers.empty?

    # Check if the string has a custom delimiter
    if string_numbers.start_with?("//")
      delimiter, string_numbers = string_numbers.split("\n")
      delimiter = delimiter[2..-1]
    else
      delimiter = ","
    end

    # Split the string by the delimiter and new line character
    numbers = string_numbers.split(/#{delimiter}|\n/)

    # Check if the string has negative numbers
    negatives = numbers.select { |number| number.to_i < 0 }
    raise "negatives not allowed: #{negatives.join(', ')}" if negatives.any?

    # Convert the string numbers to integers and sum them
    numbers.map(&:to_i).reduce(:+)

  end
end

