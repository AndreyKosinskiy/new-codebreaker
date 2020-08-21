module BeforeGame
  class RegistrationPlayer
    attr_reader :name

    MAX_LENGHT = 20
    MIN_LENGTH = 3
    def initialize(name:)
      Validation::Registration.validation(name: name, min_length: MIN_LENGTH, max_length: MAX_LENGHT)
      @name = name
    end
  end
end
