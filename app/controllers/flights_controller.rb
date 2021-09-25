class FlightsController < ApplicationController

    def index
        @from_airport = Airport.all.map { |a| ["#{a.city}, #{a.state} (#{a.airport_code})", a.id] }
        @to_airport = Airport.all.map { |a| ["#{a.city}, #{a.state} (#{a.airport_code})", a.id] }
        @departure_times = Flight.all.map { |f| [f.departure_time.strftime("%l:%M %p %m-%d-%Y"), f.id] }

    end
end