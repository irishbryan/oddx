# frozen_string_literal: true

RSpec.describe Oddx do
  it "has a version number" do
    expect(Oddx::VERSION).not_to be nil
  end

  it "all odds formats accounted for" do
    expect(Oddx::ODDS_FORMATS.length).to eq(4)
  end

  it "creates correct odds class after parsing odds" do
    expect(Oddx.parse("1/5")).to be_a(Oddx::FractionalOdds)
    expect(Oddx.parse("12/1")).to be_a(Oddx::FractionalOdds)
    expect(Oddx.parse("1.20")).to be_a(Oddx::DecimalOdds)
    expect(Oddx.parse("4")).to be_a(Oddx::DecimalOdds)
    expect(Oddx.parse("-500")).to be_a(Oddx::MoneylineOdds)
    expect(Oddx.parse("+500")).to be_a(Oddx::MoneylineOdds)
    expect(Oddx.parse("65%")).to be_a(Oddx::ProbabilityOdds)
    expect(Oddx.parse("0.1%")).to be_a(Oddx::ProbabilityOdds)
  end

  it "raises OddxError if unrecognized odds format" do
    expect { Oddx.parse("blah") }.to raise_error(Oddx::OddxError)
  end

  it "raises OddxError if odds not a string" do
    expect { Oddx.parse(2 / 1) }.to raise_error(Oddx::OddxError)
  end
end

RSpec.describe "Odds conversion" do
  test_cases = {
    "4/1": ["4/1", "5", "+400", "20%"],
    "15/8": ["15/8", "2.88", "+188", "34.7%"],
    "1/100": ["1/100", "1.01", "-10000", "99%"],
    "2": ["1/1", "2", "+100", "50%"],
    "12": ["11/1", "12", "+1100", "8.3%"],
    "1.22": ["11/50", "1.22", "-454.5", "82%"],
    "4.5": ["7/2", "4.5", "+350", "22.2%"],
    "+150": ["3/2", "2.5", "+150", "40%"],
    "+320": ["16/5", "4.2", "+320", "23.8%"],
    "-350": ["29/100", "1.29", "-350", "77.5%"],
    "-175": ["57/100", "1.57", "-175", "63.7%"],
    "26.7%": ["11/4", "3.75", "+275", "26.7%"],
    "1.5%": ["657/10", "66.7", "+6570", "1.5%"],
    "99%": ["1/100", "1.01", "-10000", "99%"],
    "71.4%": ["2/5", "1.4", "-250", "71.4%"]
  }

  test_cases.each do | test, answers |
    it "correctly converts #{test} odds" do
      odds = Oddx.parse(test.to_s)
      expect(odds.fractional).to eq(answers[0])
      expect(odds.decimal).to eq(answers[1])
      expect(odds.moneyline).to eq(answers[2])
      expect(odds.probability).to eq(answers[3])
    end
  end

  it "correctly displays all formats for 4/1" do
    odds = Oddx.parse("4/1")
    expect(odds.to_s).to eq("Fractional: 4/1, Moneyline: +400, Decimal: 5, Implied Probability: 20%")
  end
end
