# frozen_string_literal: true

module BeforeGame
  class DifficultChooser
    DIFFICULT_VARIANTS = [
      { name: 'easy', attempts: 15, hints: 2 },
      { name: 'medium', attempts: 10, hints: 1 },
      { name: 'hell', attempts: 5, hints: 1 }
    ].freeze

    attr_accessor :name, :attempts_count, :hint

    def initialize(difficult_variant:)
      @name = difficult_variant[:name]
      @attempts_count = difficult_variant[:attempts]
      @hint = BeforeGame::Hint.new(hints_count: difficult_variant[:hints])
    end
  end
end
