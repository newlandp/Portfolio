class PortfolioItemsController < ApplicationController
	def index
		@portfolio_items = PortfolioItem.all
	end

	def new
		@portfolio_item = PortfolioItem.new
	end

	def create
		@portfolio_item = PortfolioItem.new(portfolio_item_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolio_items_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
	end

private
	
	def portfolio_item_params
      params.require(:portfolio_item).permit(:title, :subtitle, :body)
    end
end
