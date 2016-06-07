module AbbCurrency
  module Adapters
    class Google
      BASE_URL = "https://www.google.com/finance/converter?a=1&from=%s&to=%s"
      
      def rates
        results = {}

        PAIRS.each do |pair|
          url = BASE_URL % [pair[:from], pair[:to]]

          body = open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
          doc = Nokogiri::HTML(body)
          if (currency = doc.at("#currency_converter_result"))
            if (m = currency.at('.bld').text.match(/([\d\.]+)/))
              results[pair[:to]] = m[0].to_f
            end
          end
        end

        results
      rescue
        nil
      end
    end
  end
end