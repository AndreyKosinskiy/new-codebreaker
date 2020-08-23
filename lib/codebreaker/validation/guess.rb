module Validation
  class Guess
    def self.validation(input_value:)
      return if input_value.scan(/\D/).empty? && size_check(input_value) && number_in_range?(input_value)

      raise ArgumentError, "Guess - number, required, length - #{Game::CodeMaker::CODE_DIGITS_COUNT} digits, each digit is a number in the range #{Game::CodeMaker::CODE_VALUE_MIN}-#{Game::CodeMaker::CODE_VALUE_MAX}"
    end

    def self.size_check(input_value)
      input_value.size == Game::CodeMaker::CODE_DIGITS_COUNT
    end

    def self.number_in_range?(input_value, range = (Game::CodeMaker::CODE_VALUE_MIN..Game::CodeMaker::CODE_VALUE_MAX))
      input_value.to_i.digits.all? { |digit| range.cover?(digit) }
    end
  end
end
