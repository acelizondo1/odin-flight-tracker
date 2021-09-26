class BookingsController < ApplicationController

    def new
        @flight = Flight.find(params["flight_id"])
        @booking = @flight.bookings.build
        puts params["passengers"]
        @passengers = []
        params["passengers"].to_i.times do
            @passengers.push(Passenger.new)
        end
    end

    def create
        puts params["passenger"]
    end

    def show

    end
end