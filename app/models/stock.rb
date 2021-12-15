class Stock < ApplicationRecord
    API_KEY= Rails.application.credentials.config[:stocks_api_key]

    belongs_to :user
    validates :ticker, presence: true, format: { without: /\s/ }

    def render_stock(ticker)
        begin
        init_api
        stock = StockQuote::Stock.quote(ticker)
        rescue RuntimeError
            stockErr = "This stock doesn't exist"
        return stock
        end
    end

    def init_api
        StockQuote::Stock.new(api_key: API_KEY)
    end
end
