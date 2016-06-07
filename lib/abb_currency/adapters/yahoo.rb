module AbbCurrency
  module Adapters
    class Yahoo
      BASE_URL = "http://query.yahooapis.com/v1/public/yql?q=select * from yahoo.finance.xchange where pair in (%s)&format=json&env=store://datatables.org/alltableswithkeys"
      def rates
        results = {}
        
        url = BASE_URL % PAIRS.map{|p| "'#{p[:from]}#{p[:to]}'"}.join(',')

        body = open(url).read
        json = Oj.load(body)
        
        PAIRS.each do |pair|
          pair_yahoo = "#{pair[:from]}#{pair[:to]}"
          # TODO fix if PAIRS.size = 1 json['query']['results']['rate'] return as object
          rate = json['query']['results']['rate'].select{|x| x['id'] == pair_yahoo}.first
          results[pair[:to]] = rate['Rate'].to_f
        end

        results
      rescue
        nil
      end
    end
  end
end