# Oddx - Convert sporting odds to any format

Oddx is a ruby library designed to simplify conversion of sporting odds to alternate formats.

[![Gem Version](https://badge.fury.io/rb/oddx.svg)](https://badge.fury.io/rb/oddx) [![Tests](https://github.com/sportsroom/oddx/actions/workflows/tests.yml/badge.svg)](https://github.com/sportsroom/oddx/actions/workflows/tests.yml)

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add oddx

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install oddx

## Usage

```ruby
require "oddx"

class OddxExample
  def self.convert(odds)
    converter = Oddx.parse(odds)

    puts "Fractional: #{converter.fractional}"
    puts "Decimal: #{converter.decimal}"
    puts "Implied Probability: #{converter.probability}"
    puts "Moneyline: #{converter.moneyline}"
  end
end
```

```shell
> OddxExample.convert("+2040")
Fractional: 102/5
Decimal: 21.4
Implied Probability: 4.7%
Moneyline: +2040

> OddxExample.convert("4/1")
Fractional: 4/1
Decimal: 5
Implied Probability: 20%
Moneyline: +400
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sportsroom/oddx.
