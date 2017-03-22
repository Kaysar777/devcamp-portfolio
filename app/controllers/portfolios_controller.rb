class PortfoliosController < ApplicationController
    def index
        @portfolio_items = Portfolio.all
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_item_params)

        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'Portfolio item was successfully created.' }
            format.json { render :show, status: :created, location: @portfolio_item }
          else
            format.html { render :new }
            format.json { render json: portfolios_path.errors, status: :unprocessable_entity }
          end
        end
    end

    private
        def portfolio_item_params
            params.require(:portfolio).permit(:title, :subtitle, :body)
        end
end
