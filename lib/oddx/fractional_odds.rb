# frozen_string_literal: true

require_relative "odds"

module Oddx
  class FractionalOdds < Oddx::Odds
    REGEX = /^(?<num>\d+)\/(?<den>\d+)$/

    def initialize(odds)
      @odds = odds
      regex_match = @odds.match(REGEX)
      @bigdecimal_odds = BigDecimal((regex_match[:num].to_f / regex_match[:den].to_f) + 1,
                                   Oddx::Odds::BIGDECIMAL_SIG_DIGITS)
    end

    def fractional
      @odds
    end
  end
end
