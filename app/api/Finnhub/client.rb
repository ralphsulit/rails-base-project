module Finnhub 
    class Client
        def self.profile(ticker)
            stock_profile = Request.call(http_method: 'get', endpoint: "/stock/profile2?symbol=#{ticker}")
        end

        def self.news(ticker)
            datePrev = Date.yesterday.strftime('%Y-%m-%d')
            dateToday = Date.today.strftime('%Y-%m-%d')
            stock_news = Request.call(http_method: 'get', endpoint: "/company-news?symbol=#{ticker}&from=#{datePrev}&to=#{dateToday}")
        end
    end
end