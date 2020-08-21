module BeforeGame
  class RegistrationPlayer
    attr_reader :name

    def initialize(name:)
      Validation::Registration.validation(name: name)
      @name = name
    end
  end
end
