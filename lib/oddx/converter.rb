# frozen_string_literal: true

require_relative "formats"

module Oddx
  class Converter
    def self.convert(odds, source_format: nil, target_format: nil)
      raise NotImplementedError
    end

    def self.determine_odds_format(odds)
      # Loop over formats, match to regex or raise exception
      Oddx::FORMATS.each do |key, value|
        if odds.match value.regex
          return value.key
        end
      end
      raise "Unrecognized format"
    end
  end
end
