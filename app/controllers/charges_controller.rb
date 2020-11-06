class ChargesController < ApplicationController
  def new
    @event = Event.find_by(id: params[:event_id])
    @price = @event.price
  end

  def create
    @event = Event.find_by(id: params[:event_id])
    @price = @event.price
    amount = @price * 100

    # if is_a?(@event)
    #   Attendance.create(user_id: current_user.id, event_id: @event.id)
    #   redirect_to event_path(@event.id)
    # else
    customer =
      Stripe::Customer.create(
        { email: params[:stripeEmail], source: params[:stripeToken] }
      )

    charge =
      Stripe::Charge.create(
        {
          customer: customer.id,
          amount: amount,
          description: 'Rails Stripe customer',
          currency: 'usd'
        }
      )

    if customer.save && charge.save
      Attendance.create(
        event_id: @event.id,
        user_id: current_user.id,
        stripe_customer_id: customer.id
      )
      redirect_to event_path(@event.id)
    else
      render 'new'
    end
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end # Amount in cents # Amount in cents
end
