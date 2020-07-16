module Statistic
  class StatisticSheet
    def initialize(storage:, row: nil)
      @new_row = row
      @rows = nil
      @storage = storage
    end

    def store
      # @rows = storage.load
      storage.store([@new_row])
    end

    def load
      storage.load
    end
  end
end
