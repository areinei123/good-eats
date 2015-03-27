class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def index
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reviews = @restaurant.reviews
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant

    if @review.save
      flash[:notice] = "Review saved successfully."
      redirect_to restaurant_reviews_path(@restaurant)
    else
      flash[:alert] = "Failed to save review."
      render :new
    end
  end

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
