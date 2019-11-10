class AttendancesController < ApplicationController

    def index
        @attendances = Attendance.all
        @event = Event.find(params[:event_id])
    end

    def new
        @event = Event.find(params[:event_id])

        # Set your secret key: remember to change this to your live secret key in production
        # See your keys here: https://dashboard.stripe.com/account/apikeys
        Stripe.api_key = 'sk_test_6GzuJHSFQOJlCFQW1HpMTeVC00JWiIuFfb'

        @session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: 'T-shirt',
            description: 'Comfortable cotton t-shirt',
            images: ['https://example.com/t-shirt.png'],
            amount: 500,
            currency: 'usd',
            quantity: 1,
          }],
          success_url: 'http://127.0.0.1:3000/?session_id={CHECKOUT_SESSION_ID}',
          cancel_url: 'http://127.0.0.1:3000/',
        )

    end

    def create

    end
end
