module Statistic
  class StatisticSheet
    attr_accessor :new_row

    def initialize(storage:, row: nil)
      @new_row = row
      @rows = nil
      @storage = storage
    end

    def store
      @rows = Array(load)
      if @rows.nil?
        @rows = @new_row
      else
        @rows.append(@new_row)
        @rows.sort_by! { |row| [row.init_attempts_count, row.used_attempts_count, row.used_hints_count] }
        @rows.map.with_index { |row, rating| row.rating = rating + 1 }
      end
      @storage.store(@rows)
    end

    private

    def load
      @storage.load
    end
  end
end
