module Validation
  class Guess
    def self.validation(input_value:)
      (input_value.to_i.is_a? Integer) && input_value.size == 4 && input_value.to_i.digits.all? { |n| (1..6).cover?(n) }
    end
  end
end
