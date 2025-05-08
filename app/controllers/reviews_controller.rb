class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :set_reviews, only: [ :edit, :update ]
  def new
    @hair = Hair.find(params[:hair_id])
    @review = Review.new
    @review.user = current_user
  end

  def create
    @hair = Hair.find(params[:hair_id])
    @review = Review.new(review_params)
    @review.hair = @hair
    if @review.save
      redirect_to hair_path(@hair), alert: "Your review has been successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    if @review.update
      redirect_to hair_path(@hair), alert: "Your review has been successfully edited."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_reviews
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
