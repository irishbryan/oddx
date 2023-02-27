# frozen_string_literal: true

module Oddx
  class ProbabilityOdds < Odds
    REGEX = /^(?<value>\d+\.?\d+)?%/

    def initialize(odds)
      @odds = odds
      @bigdecimal_odds = BigDecimal(1 / (odds.to_f / 100),
                                   Oddx::Odds::BIGDECIMAL_SIG_DIGITS)
    end

    def probability
      @odds
    end
  end
end
