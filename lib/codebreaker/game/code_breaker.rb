require_relative '../validation/guess'
module Game
  class CodeBreaker
    include Validation

    def initialize(player:, difficult:)
      @current_stat = Statistic::StatisticRow.new(player: player, difficult_init: difficult)
      @code = Game::CodeMaker.new.code
      @hint = difficult.hint
      @hint.generate_hints(@code)
    end

    def my_guess(input_value:)
      Validation::Guess.validation(input_value: input_value)
      input_value = input_value.split('').map(&:to_i)
      @current_stat.used_attempts_count += 1 if can_use_attempts?
      check_guess(input_value)
    end

    def player_win?(guess)
      guess.count(true) == CodeMaker::CODE_DIGITS_COUNT
    end

    def each_element_as(arr, value)
      return [] if arr.nil?

      arr.map { |_element| value }
    end

    def check_guess(guess)
      position_result = position_checker(guess)
      include_result = digits_checker(guess, position_result)
      each_element_as(position_result, true) + each_element_as(include_result, false)
    end

    def digits_checker(guess, uncheck_digits)
      result = []
      guess.map do |digit|
        result.push(digit) if !uncheck_digits.include?(digit) && @code.include?(digit) && !result.include?(digit)
      end
      result.compact
    end

    def position_checker(guess)
      @code.zip(guess).map { |code_digit, guess_digit| guess_digit if code_digit == guess_digit }.compact
    end

    def can_use_attempts?
      @current_stat.init_attempts_count > @current_stat.used_attempts_count
    end

    def hint
      @hint.hint
    end
  end
end
