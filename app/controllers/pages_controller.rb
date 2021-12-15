class PagesController < ApplicationController
  def index
    
  end

  def home
    if params[:ticker] == ""
      @blankSearch = "Please enter stock code"
    else params[:ticker]
      @stock = Stock.new
      @stock = @stock.render_stock(params[:ticker])
    end
   
  end
  
  private



end