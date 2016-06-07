require 'spec_helper'

describe AbbCurrency do
  
  describe '#from' do
    it 'should return Google currency rates' do
      rates = AbbCurrency.from :google
      expect(rates).not_to be_nil
      expect(rates['adapter']).to eq 'Google'
      expect(rates['USD']).to eq 1
      expect(rates['RUB']).to be > 0
      expect(rates['EUR']).to be > 0
    end

    it 'should return Yahoo currency rates' do
      rates = AbbCurrency.from :yahoo
      expect(rates).not_to be_nil
      expect(rates['adapter']).to eq 'Yahoo'
      expect(rates['USD']).to eq 1
      expect(rates['RUB']).to be > 0
      expect(rates['EUR']).to be > 0
    end
  end

  describe '#rates' do 
    it 'should return currency rates from default adapter' do
      rates = AbbCurrency.rates
      expect(rates).not_to be_nil
      expect(rates['adapter']).to eq 'Yahoo'
      expect(rates['USD']).to eq 1
      expect(rates['RUB']).to be > 0
      expect(rates['EUR']).to be > 0
    end
    
    it 'should customize pair' do
      AbbCurrency::PAIRS << { from: 'USD', to: 'UAH' }
      rates = AbbCurrency.rates
      expect(rates).not_to be_nil
      expect(rates['adapter']).to eq 'Yahoo'
      expect(rates['USD']).to eq 1
      expect(rates['RUB']).to be > 0
      expect(rates['EUR']).to be > 0
    end
  end
end