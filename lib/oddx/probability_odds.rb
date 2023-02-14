# frozen_string_literal: true

require_relative "odds"

module Oddx
  class ProbabilityOdds < Oddx::Odds
    REGEX = /^(?<value>\d+\.?\d+)?%/

    def initialize(odds)
      @bigdecimal_odds = BigDecimal(1 / (odds.to_f / 100),
                                    Oddx::Odds::BIGDECIMAL_SIG_DIGITS)
      super(odds)
    end

    def probability
      @odds
    end
  end
end
