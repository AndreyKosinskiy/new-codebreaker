module Validation
  class Registration
    def self.validation(name:, min_length:, max_length:)
      return if (name.is_a? String) && (min_length..max_length).cover?(name.size)

      raise ArgumentError, "Name - string, required, min length - #{min_length} symbols, max length - #{max_length}"
    end
  end

  class DifficultChooser
    def self.validation(name:, avalible_difficult:)
      return if avalible_difficult.any? { |variant| variant[:name] == name }

      raise ArgumentError, 'difficult name - unknown'
    end
  end
end
