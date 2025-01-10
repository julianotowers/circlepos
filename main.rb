require_relative 'app/services/isbn13_calculator_service'

isbn = '978014300723'
calculator = ISBN13CalculatorService.new(isbn)
puts "Complete ISBN-13: #{calculator.call}"