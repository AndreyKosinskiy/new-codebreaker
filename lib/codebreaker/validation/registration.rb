module Validation
  class Registration
    def self.validation(name:)
      return if (name.is_a? String) && (3..20).cover?(name.size)

      raise ArgumentError, 'Name - string, required, min length - 3 symbols, max length - 20'
    end
  end

  class DifficultChooser
    def self.validation(name:, avalible_difficult:)
      return if avalible_difficult.any? { |variant| variant[:name] == name }

      raise ArgumentError, 'difficult name - unknown'
    end
  end
end
