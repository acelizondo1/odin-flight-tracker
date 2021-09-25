class FlightsController < ApplicationController

    def index
        @from_airport = Airport.all.map{ |a| ["#{a.city}, #{a.state} (#{a.airport_code})", a.id] }
        @to_airport = Airport.all.map { |a| ["#{a.city}, #{a.state} (#{a.airport_code})", a.id] }

    end
end