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

## Usage
```ruby
AbbCurrency.from :google
AbbCurrency.from :yahoo

# Yahoo by default or Google if someting went wrong
AbbCurrency.rates
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/abb_currency.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

