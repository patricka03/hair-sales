class OrdersController < ApplicationController

  before_action :authenticate_user!

  def create
    @hair = Hair.find(params[:hair_id])
    @order = Order.new(order_params)
    @order.price = @hair.price * @order.quantity
    @order.user = current_user

    if @order.quantity > @hair.quantity
      redirect_to hair_path(@hair), alert: "Not enough stock available."
      return
    end

    if @order.save
      @hair.update(quantity: @hair.quantity - @order.quantity)
      redirect_to dashboard_path, notice: "Order placed successfully!"
    else
      redirect_to hair_path(@hair), status: :unprocessable_entity, notice: "Failed to create order"
    end
  end


  def checkout
    @hair = Hair.find(params[:hair_id])
    @order = @hair.orders.find(params[:id])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ["card"],
      line_items: [{
        price_data: {
          currency: "usd",
          product_data: {
            name: @order.hair.name
          },
          unit_amount: (@order.price / @order.quantity * 100).to_i # Price per unit
        },
        quantity: @order.quantity # User’s selected quantity
      }],
      mode: "payment",
      success_url: "#{request.base_url}#{success_hair_order_path(@hair, @order)}",
      cancel_url: "#{request.base_url}#{cancel_hair_order_path(@hair, @order)}"
    )

    redirect_to session.url, allow_other_host: true
  end

  def success
    @order = Order.find(params[:id])
    @order.update(status: "paid")
    redirect_to dashboard_path, notice: "Payment successful!"
  end

  def cancel
    redirect_to dashboard_path, alert: "Payment was canceled. Please try again."
  end

  private

  def order_params
    params.require(:order).permit(:hair_id, :quantity)
  end

end
