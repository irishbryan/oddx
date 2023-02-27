# frozen_string_literal: true

require_relative "oddx/version"
require_relative "oddx/odds"
require_relative "oddx/decimal_odds"
require_relative "oddx/fractional_odds"
require_relative "oddx/moneyline_odds"
require_relative "oddx/probability_odds"
require_relative "oddx/oddx_error"

# The main Oddx driver
module Oddx
  # Convert sporting odds to any format
  #
  # Example:
  #   >> odds = Oddx.parse "3/1"
  #   >> odds.moneyline
  #   => "+300"
  #   >> odds.decimal
  #   => "4"
  #   >> odds.probability
  #   => "25%"
  #   >> odds.fractional
  #   => "3/1"
  #
  # Supported formats:
  #   1. moneyline (e.g. +300, -300)
  #   2. fractional (e.g. 3/1, 1/5)
  #   3. decimal (e.g. 1.2, 4)
  #   4. probability (e.g. 95%, 30%)

  ODDS_FORMATS = [
    FractionalOdds,
    MoneylineOdds,
    DecimalOdds,
    ProbabilityOdds
  ]

  def self.parse(odds)
    begin
      ODDS_FORMATS.each do |format|
        if odds.match format::REGEX
          return format.new(odds)
        end
      end
    rescue NoMethodError
      raise OddxError.new(msg: "Error parsing odds, provide as String to avoid ambiguity. e.g: '+4000'", odds: odds)
    end
    raise OddxError.new(odds: odds)
  end
end
