class PortfolioItemsController < ApplicationController
  before_action :set_portfolio_item, only: [:show, :edit, :update, :destroy]
  layout "portfolio_item"
  access all: [:show, :index, :angular], user: { except: [:new, :create, :edit, :update, :destroy]}, site_admin: :all

  def index
    @portfolio_items = PortfolioItem.all
  end

  #example custom angular scope action
  def angular
    @angular_portfolio_items = PortfolioItem.angular
  end

  def show
  end

  def new
    @portfolio_item = PortfolioItem.new
    3.times { @portfolio_item.technologies.build }
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

  def edit
  end

  def update
    respond_to do |format|
      if @portfolio_item.update(portfolio_item_params)
        format.html { redirect_to portfolio_items_path, notice: 'Portfolio item was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_items_url, notice: 'Portfolio Item was successfully destroyed.' }
    end
  end

private
  
  def portfolio_item_params
    params.require(:portfolio_item).permit(:title,
                                           :subtitle,
                                           :body,
                                           technologies_attributes: [:name])
  end

  def set_portfolio_item
    @portfolio_item = PortfolioItem.find(params[:id])
  end
end
