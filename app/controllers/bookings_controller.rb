class BookingsController < ApplicationController
    before_action :set_flight, only: [:new]

    def index
        @search_submit = false
        @email = params["email"]
        if @email
            @search_submit = true
            @bookings = Booking.joins(:passengers).where("email=?", params["email"])
        end
    end

    def new
        @booking = Booking.new
        @passengers = params["passengers"].to_i
        @passengers.times do
            @booking.passengers.build
        end
    end

    def create
        @booking = Booking.new(booking_params)
        
        puts @booking.id
        respond_to do |format|
            if @booking.save
                format.html { redirect_to booking_path(@booking), notice: 'Your flight booking has been successfully submitted' }
            else
                @flight = Flight.find(params[:booking][:flight_id])
                format.html { render :new, notice: :unprocessable_entity }
            end
        end
    end

    def show
        @booking = Booking.find(params[:id])
        @flight = Flight.find(@booking.flight_id)        
    end

    private 
    def booking_params
        params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
    end

    def set_flight
        @flight = Flight.find(params["flight_id"])
    end
end