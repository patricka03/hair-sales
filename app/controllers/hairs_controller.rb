class HairsController < ApplicationController
  before_action :authenticate_user!, only: [ :home, :show ]
  before_action :authorize_admin, only: [ :new, :create ]

  def home
    @hairs = Hair.all
  end

  def show
    @hair = Hair.find(params[:id])
  end

  def new
    @hair = Hair.new
  end

  def create
    @hair =Hair.new(hair_params)
    if @hair.save
      redirect_to hairs_path(@hair), notice: "Hair successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def authorize_admin
    redirect_to root_path, alert: "You are not authorized to add hair." unless current_user.admin?
  end

  def hair_params
    params.require(:hair).permit(:name, :price, :length, :texture, :origin, :quantity, :photo)
  end

end
