# frozen_string_literal: true

module Game
  class CodeMaker
    CODE_DIGITS_COUNT = 4
    CODE_VALUE_MIN = 1
    CODE_VALUE_MAX = 6

    attr_accessor :code

    def initialize
      @code = generate_code
    end

    private

    def generate_code
      Array.new(CODE_DIGITS_COUNT).map { (CODE_VALUE_MIN..CODE_VALUE_MAX).to_a.sample }
    end
  end
end
