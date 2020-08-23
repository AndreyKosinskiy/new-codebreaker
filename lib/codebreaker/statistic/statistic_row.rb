module Statistic
  class StatisticRow
    attr_accessor :player_name, :init_attempts_count, :init_hints_count,
                  :used_attempts_count, :used_hints_count, :difficult_name,
                  :rating

    def initialize(player:, difficult_init:)
      @rating = nil
      @player_name = player.name
      @difficult_name = difficult_init.name
      @init_attempts_count = difficult_init.attempts_count
      @init_hints_count = difficult_init.hint.hints_count
      @used_attempts_count = 0
      @used_hints_count = 0
    end

    def can_use_attempts?
      init_attempts_count > used_attempts_count
    end

    def can_use_hints?
      init_hints_count > used_hints_count
    end
  end
end
