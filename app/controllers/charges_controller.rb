class ChargesController < ApplicationController

  before_action :authenticate_user!
  
  def create
    charge = Stripe::Checkout::Session.create(
      customer_email: current_user.email,
      success_url: 'https://84f2e602.ngrok.io',
      cancel_url: 'https://84f2e602.ngrok.io',
      payment_method_types: ['card'],
      line_items: [{
        name: "Plue's Productions purchase",
        amount: current_user.total_price_in_cart_for_stripe,
        currency: 'usd',
        quantity: 1
      }],
    )

    render json: {charge: charge}
  end
end
