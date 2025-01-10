require_relative '../../../app/services/isbn13_calculator_service'

RSpec.describe ISBN13CalculatorService do
  describe '#call' do
    it 'calculates the correct check digit and returns the complete ISBN' do
      isbn = '978014300723'
      service = ISBN13CalculatorService.new(isbn)

      expect(service.call).to eq('9780143007234')
    end

    it 'raises an error for invalid ISBN input (non-numeric characters)' do
      isbn = '97801430072X'

      expect { ISBN13CalculatorService.new(isbn) }.to raise_error(
        ISBN13CalculatorService::InvalidISBNError,
        "Invalid ISBN input. It must be a string of exactly 12 numeric characters."
      )
    end

    it 'raises an error for invalid ISBN input (too short)' do
      isbn = '9780143007'

      expect { ISBN13CalculatorService.new(isbn) }.to raise_error(
        ISBN13CalculatorService::InvalidISBNError,
        "Invalid ISBN input. It must be a string of exactly 12 numeric characters."
      )
    end
  end
end
