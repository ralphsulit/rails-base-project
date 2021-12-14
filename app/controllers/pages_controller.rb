class PagesController < ApplicationController
  def index
    
  end

  def home
    if params[:ticker] == ""
      @blankSearch = "Please enter stock code"
    elsif params[:ticker]
      begin
        StockQuote::Stock.new(api_key: Rails.application.credentials.config[:stocks_api_key] )
        @stock = StockQuote::Stock.quote(params[:ticker])
      rescue RuntimeError
        @stockErr = "This stock doesn't exist"
      end

    end
   
  end
  
  private

end