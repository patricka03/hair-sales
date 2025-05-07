class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @threeHairs = Hair.limit(3)
    @hairs = Hair.all
  end

  def dashboard
    @user_bookings = Order.where(user_id: current_user.id)
    @orders = current_user.order.includes(:hair)
    @order = @orders.last
  end
end
