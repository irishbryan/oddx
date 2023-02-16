# Oddx - Convert sporting odds to any format

Oddx is a ruby library designed to simplify conversion of sporting odds to alternate formats.

## Installation

Install the gem and add to the application's Gemfile by executing:

    `$ bundle add oddx`

If bundler is not being used to manage dependencies, install the gem by executing:

    `$ gem install oddx`

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

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sportsroom/oddx.
