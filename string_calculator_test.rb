# string_calculator_test.rb
require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test

  # Test Case - Empty string case
  def test_empty_string
    calculator = StringCalculator.new
    assert_equal 0, calculator.add("")
  end

  # Test Case - Single number case
  def test_single_number
    calculator = StringCalculator.new
    assert_equal 1, calculator.add("1")
  end

  # Test Case - Two numbers case
  def test_two_numbers
    calculator = StringCalculator.new
    assert_equal 3, calculator.add("1,2")
  end

  # Test Case - Multiple numbers case
  def test_multiple_numbers
    calculator = StringCalculator.new
    assert_equal 6, calculator.add("1,2,3")
  end

  # Test Case - New line character case
  def test_new_line_character
    calculator = StringCalculator.new
    assert_equal 6, calculator.add("1\n2,3")
  end

  # Test Case - Custom delimiter case
  def test_custom_delimiter
    calculator = StringCalculator.new
    assert_equal 3, calculator.add("//;\n1;2")
  end

  # Test Case - Negative number case
  def test_negative_number
    calculator = StringCalculator.new
    assert_raises(RuntimeError) { calculator.add("1,-2") }
  end

end