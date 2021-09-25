class FlightsController < ApplicationController
    before_action :set_search_submit 
    def index
        if params['from_airport_id']
            @search_submit = true
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