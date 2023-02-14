# frozen_string_literal: true

module Oddx
  OddsFormat = Struct.new(:key, :description, :regex, :template, keyword_init: true)

  FORMATS = {
    FRACTIONAL: OddsFormat.new(key: :FRACTIONAL,
                               description: "Fractional",
                               regex: /^(?<num>\d+)\/(?<den>\d+)$/,
                               template: "%d/%d"),
    DECIMAL: OddsFormat.new(key: :DECIMAL,
                            description: "Decimal",
                            regex: /^(?<val>\d*\.?\d+$)/,
                            template: "%f"),
    MONEYLINE: OddsFormat.new(key: :MONEYLINE,
                              description: "American (Moneyline)",
                              regex: /^(?<mod>\+|-)(?<value>\d+)$/,
                              template: "%s%d"),
    PROBABILITY: OddsFormat.new(key: :PROBABILITY,
                                description: "Implied Probability",
                                regex: /^(?<value>\d+\.?\d+)?%/,
                                template: "%f%")
  }
end
