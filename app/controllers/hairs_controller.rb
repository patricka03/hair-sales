class HairsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  before_action :set_hair, only: [:show, :edit, :update]

  def index
    @hairs = Hair.all
  end

  def show
    @order = Order.new
    @review = Review.new 
    @hair = Hair.find(params[:id])
    @reviews = @hair.reviews
  end

  def new
    @hair = Hair.new
  end

  def create
    if current_user.admin?
      @hair = Hair.new(hair_params)
      @hair.admin = current_user
        if @hair.save
          redirect_to hairs_path(@hair), notice: "Hair successfully created!"
        else
          render :new, status: :unprocessable_entity
        end
    else
      redirect_to hairs_path(@hair), notice: "You are not authorized to add hair."
    end
  end

  def edit
  end

  def update
    if current_user.admin?
      @hair.admin = current_user
        if @hair.update(hair_params)
          redirect_to hairs_path(@hair), notice: "Hair successfully updated!"
        else
          render :edit, status: :unprocessable_entity
        end
    else
      redirect_to hairs_path(@hair), notice: "You are not authorized to add hair."
    end
  end

  private

  def set_hair
    @hair = Hair.find(params[:id])
  end

  def hair_params
    params.require(:hair).permit(:name, :price, :length, :texture, :origin, :quantity, :photo)
  end

end
