require "abb_currency/version"
require 'open-uri'
require 'nokogiri'
require 'oj'

module AbbCurrency
  PAIRS = [{from: 'USD', to: 'RUB'}, {from: 'USD', to: 'EUR'}]

  def self.from(source)
    adapter = const_get(
      %W(AbbCurrency Adapters #{source.to_s.capitalize}).join("::")
    ).new
    _rates = adapter.rates # save the result
    _rates.nil? ? nil : _rates.merge('USD' => 1, 'adapter' => source.to_s.capitalize)
  end

  def self.rates
    from(:yahoo) || from(:google)
  end
end

require "abb_currency/adapters/google"
require "abb_currency/adapters/yahoo"
