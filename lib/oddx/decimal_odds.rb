# frozen_string_literal: true

require_relative "odds"

module Oddx
  class DecimalOdds < Oddx::Odds
    REGEX = /^(?<val>\d*\.?\d+$)/

    def initialize(odds)
      @bigdecimal_odds = BigDecimal(odds, Oddx::Odds::BIGDECIMAL_SIG_DIGITS)
      super(odds)
    end

    def decimal
      @odds
    end
  end
end
