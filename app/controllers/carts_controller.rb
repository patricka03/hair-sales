class CartsController < ApplicationController
  def show
    @cart_items = Hair.where(id: session[:cart])
    @user_bookings = Order.where(user_id: current_user.id)
    @orders = current_user.order.includes(:hair)
    @order = @orders.last
  end

  def remove_from_cart
    session[:cart].delete(params[:hair_id])
    redirect_to cart_path, notice: "Item removed!"
  end

  def checkout
    session[:cart].each do |hair_id|
      Order.create(user: current_user, hair_id: hair_id, order_status: "processing")
    end
    session[:cart] = []
    redirect_to success_path, notice: "Checkout complete!"
  end

end
