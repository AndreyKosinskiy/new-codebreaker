# frozen_string_literal: true

module BeforeGame
  class Hint
    attr_accessor :hints_count, :hints_items
    def initialize(hints_count:)
      @hints_count = hints_count
    end

    def generate_hints(code)
      @hints_items = code.sample(@hints_count)
    end

    def hint
      return 'User used all the hints' if @hints_count.zero?

      @hints_items.pop
    end
  end
end
