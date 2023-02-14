# frozen_string_literal: true

module Oddx
  class OddxError < StandardError
    attr_reader :odds
    def initialize(msg: "Ensure provided odds match supported formats", odds: nil)
      @odds = odds
      super(msg)
    end
  end
end
