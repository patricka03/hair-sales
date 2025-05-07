class HairsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]

  def index
    @hairs = Hair.all
  end

  def show
    @hair = Hair.find(params[:id])
    @order = Order.new
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

  private

  def hair_params
    params.require(:hair).permit(:name, :price, :length, :texture, :origin, :quantity, :photo)
  end

end
