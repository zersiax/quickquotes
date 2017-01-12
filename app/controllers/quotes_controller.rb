class QuotesController < ApplicationController
  def index
  @quote = Quote.order("RANDOM()").first
 end 
def new
@quote = Quote.new
end

def create
@quote = Quote.create(quote_params)
if @quote.invalid?
  flash[:error] = "<strong>Not today, pal</strong>The data you entered made a lot of people very angry. Please try again."
end  
redirect_to root_path
end

private

def quote_params

params.require(:quote).permit(:saying, :author)
end
 end
