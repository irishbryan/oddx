# frozen_string_literal: true

require_relative "odds"

module Oddx
  class MoneylineOdds < Oddx::Odds
    REGEX = /^(?<mod>\+|-)(?<value>\d+\.?\d+)$/

    def initialize(odds)
      @odds = odds
      regex_match = @odds.match(REGEX)
      case regex_match[:mod]
      when "+"
        @bigdecimal_odds = BigDecimal((regex_match[:value].to_f / 100) + 1,
                                      Oddx::Odds::BIGDECIMAL_SIG_DIGITS)
      else
        @bigdecimal_odds = BigDecimal((100 / regex_match[:value].to_f) + 1,
                                      Oddx::Odds::BIGDECIMAL_SIG_DIGITS)
      end
    end

    def moneyline
      @odds
    end
  end
end
