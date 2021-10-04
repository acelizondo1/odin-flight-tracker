class PassengerMailer < ApplicationMailer

    def confirmation_email
        @booking = params[:booking]
        @flight = Flight.find(@booking.flight_id)
        @passenger = params[:passenger]
        @booking_url = "localhost:3000/bookings/#{@booking.id}"
        mail(to: @passenger.email, subject: 'Your Flight Is Booked')
    end
end
