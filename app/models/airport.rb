class Airport < ApplicationRecord
    has_many :departing_flights, foreign_key: :from_airport_id, class_name: "Flight"
    has_many :arrival_flights, foreign_key: :to_airport_id, class_name: "Flight"

    def self.details(id)
        airport = Airport.find(id)
        airport_string = "#{airport.city}, #{airport.state} (#{airport.airport_code})"
    end
end
