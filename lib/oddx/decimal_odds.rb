# frozen_string_literal: true

require_relative "odds"

module Oddx
  class DecimalOdds < Oddx::Odds
    REGEX = /^(?<val>\d*\.?\d+$)/

    def initialize(odds)
      @odds = odds
      @bigdecimal_odds = BigDecimal(odds, Oddx::Odds::BIGDECIMAL_SIG_DIGITS)
    end

    def decimal
      @odds
    end
  end
end
