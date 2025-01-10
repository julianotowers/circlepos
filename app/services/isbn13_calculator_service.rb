require 'logger'

class ISBN13CalculatorService
  class InvalidISBNError < StandardError; end

  def initialize(isbn, logger = Logger.new($stdout))
    @isbn = isbn
    @logger = logger
    validate_input
  end

  def call
    @logger.info("Calculating check digit for ISBN: #{@isbn}")
    complete_isbn = "#{@isbn}#{calculate_check_digit}"
    @logger.info("Complete ISBN: #{complete_isbn}")
    complete_isbn
  end

  private

  def validate_input
    unless @isbn.is_a?(String) && @isbn.match?(/^\d{12}$/)
      @logger.error("Invalid ISBN: #{@isbn}")
      raise InvalidISBNError, "Invalid ISBN input. It must be a string of exactly 12 numeric characters."
    end
  end

  def calculate_check_digit
    sum = @isbn.chars.each_with_index.sum do |digit, index|
      digit.to_i * (index.even? ? 1 : 3)
    end

    check_digit = 10 - sum % 10
    check_digit == 10 ? 0 : check_digit
  end
end