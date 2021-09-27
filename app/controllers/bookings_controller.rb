class BookingsController < ApplicationController

    def new
        @flight = Flight.find(params["flight_id"])
        @booking = Booking.new
        @passengers = params["passengers"].to_i
        @passengers.times do
            @booking.passengers.build
        end
    end

    def create
        
    end

    def show
        
    end

    private 
    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end
end