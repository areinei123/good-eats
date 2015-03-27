class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @review = Review.new
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      flash[:notice] = 'Restaurant added!'
      redirect_to @restaurant
    else
      flash[:alert] = 'Restaurant not added!'
      render :new
    end

  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state,
      :zip_code, :description, :category)
  end

end
