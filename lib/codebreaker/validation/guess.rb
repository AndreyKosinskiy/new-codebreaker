module Validation
  class Guess
    def self.validation(input_value:)
      return if input_value.scan(/\D/).empty? && input_value.size == 4 && number_in_range?(input_value)

      raise ArgumentError, 'Guess - number, required, length - 4 digits, each digit is a number in the range 1-6'
    end

    def self.number_in_range?(input_value, range = (1..6))
      input_value.to_i.digits.all? { |digit| range.cover?(digit) }
    end
  end
end
