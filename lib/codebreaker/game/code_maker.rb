module Game
  class CodeMaker
    CODE_DIGITS_COUNT = 4
    CODE_DIGITS_RANGE = (1..6).freeze
    
    attr_accessor :code
    
    def initialize
      @code = generate_code
    end

    private

    def generate_code
      CODE_DIGITS_RANGE.to_a.sample(CODE_DIGITS_COUNT)
    end
  end
end