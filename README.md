# AbbCurrency

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'abb_currency'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install abb_currency

Test running:

	bundle exec rake spec

## Usage
```ruby
AbbCurrency.from :google # => {"RUB"=>64.9763, "EUR"=>0.8804, "USD"=>1, "adapter"=>"Google"}
AbbCurrency.from :yahoo # => {"RUB"=>64.9763, "EUR"=>0.8804, "USD"=>1, "adapter"=>"Yahoo"}

# Yahoo by default or Google if something went wrong
AbbCurrency.rates # => {"RUB"=>64.9763, "EUR"=>0.8804, "USD"=>1, "adapter"=>"Yahoo"}

# Customize currency pairs
AbbCurrency::PAIRS << { from: 'USD', to: 'UAH' }
AbbCurrency.rates # => {"RUB"=>65.112, "EUR"=>0.8799, "UAH"=>24.955, "USD"=>1, "adapter"=>"Yahoo"}
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/abb_currency.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

