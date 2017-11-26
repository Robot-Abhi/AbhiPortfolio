class PortfoliosController < ApplicationController

  def index
 	  @portfolio_items = Portfolio.all
  end

  def angular
        @angular_portfolio_items = Portfolio.angular
  end

  def new
   	@portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new(params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: 'Portfolio was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit 
 	  @portfolio_item = Portfolio.find(params[:id])
  end

  def update
 	  @portfolio_item = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio_item.update(params.require(:portfolio).permit(:title, :subtitle, :bod, :main_image, :thumb_image  ))
        format.html { redirect_to portfolios_path, notice: 'The record was successfully updated.' }
        # format.json { render :show, status: :ok, location: @blog }
      else
        format.html { render :edit }
        #format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  def show 
 	  @portfolio_item = Portfolio.find(params[:id])
  end
  

  def destroy
    @portfolio_item = Portfolio.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: 'Blog was successfully destroyed.' }
     end
  end
end

