# frozen_string_literal: true

RSpec.describe Oddx do
  it "has a version number" do
    expect(Oddx::VERSION).not_to be nil
  end

  it "all odds formats accounted for" do
    expect(Oddx::FORMATS[:FRACTIONAL].description).to eq("Fractional")
    expect(Oddx::FORMATS[:DECIMAL].description).to eq("Decimal")
    expect(Oddx::FORMATS[:MONEYLINE].description).to eq("American (Moneyline)")
    expect(Oddx::FORMATS[:PROBABILITY].description).to eq("Implied Probability")
  end

  it "automatically detects odds format correctly" do
    expect_odds_format(odds: "1/5", format: Oddx::FORMATS[:FRACTIONAL].key)
    expect_odds_format(odds: "12/1", format: Oddx::FORMATS[:FRACTIONAL].key)
    expect_odds_format(odds: "1.20", format: Oddx::FORMATS[:DECIMAL].key)
    expect_odds_format(odds: "4", format: Oddx::FORMATS[:DECIMAL].key)
    expect_odds_format(odds: "-500", format: Oddx::FORMATS[:MONEYLINE].key)
    expect_odds_format(odds: "+500", format: Oddx::FORMATS[:MONEYLINE].key)
    expect_odds_format(odds: "65%", format: Oddx::FORMATS[:PROBABILITY].key)
    expect_odds_format(odds: "0.1%", format: Oddx::FORMATS[:PROBABILITY].key)
  end

  private def expect_odds_format(odds:, format:)
    expect(Oddx::Converter.determine_odds_format(odds)).to eq(format)
  end
end
