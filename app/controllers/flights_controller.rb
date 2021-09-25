class FlightsController < ApplicationController

    def index
        @from_airport = Airport.all.map { |a| ["#{a.city}, #{a.state} (#{a.airport_code})", a.id] }
        @to_airport = Airport.all.map { |a| ["#{a.city}, #{a.state} (#{a.airport_code})", a.id] }
        @departure_times = generate_dates.map { |d| [d.strftime("%m-%d-%Y"), d] }

    end


    private
    def generate_dates
        dates = Flight.distinct.order("date(departure_time)").pluck("date(departure_time)")
    end
end