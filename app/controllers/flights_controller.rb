class FlightsController < ApplicationController
    before_action :set_search_submit 
    def index
        if params['from_airport_id']
            @search_submit = true
            @found_flights = Flight.find_flights(params['from_airport_id'], params['to_airport_id'], params['date'])
            @passengers = params['passengers']
        end
        @from_airport = Airport.all.map { |a| ["#{a.city}, #{a.state} (#{a.airport_code})", a.id] }
        @to_airport = Airport.all.map { |a| ["#{a.city}, #{a.state} (#{a.airport_code})", a.id] }
        @departure_times = Flight.generate_dates.map { |d| [d.strftime("%m-%d-%Y"), d] }
    end


    private
    def set_search_submit
        @search_submit = false
    end

end