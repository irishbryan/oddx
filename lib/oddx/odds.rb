# frozen_string_literal: true

require "bigdecimal"

module Oddx
  class Odds
    BIGDECIMAL_SIG_DIGITS = 3

    def initialize
      raise NotImplementedError
    end

    def decimal
      "%g" % (@bigdecimal_odds.round(2))
    end

    def fractional
      (@bigdecimal_odds - 1).to_r.rationalize.to_s
    end

    def moneyline
      if @bigdecimal_odds >= 2
        "+%g" % ((@bigdecimal_odds - 1) * 100).round(1)
      else
        "%g" % (-100 / (@bigdecimal_odds - 1)).round(1)
      end
    end

    def probability
      "%g%%" % ((1 / @bigdecimal_odds) * 100).round(1)
    end

    def to_s
      "Fractional: #{fractional}, Moneyline: #{moneyline}, Decimal: #{decimal}, Implied Probability: #{probability}"
    end
  end
end
