class Flight < ApplicationRecord
    belongs_to :to_airport, class_name: "Airport"
    belongs_to :from_airport, class_name: "Airport"
    has_many :bookings
    has_many :passengers, through: :bookings

    scope :generate_dates, -> { distinct.order("date(departure_time)").pluck("date(departure_time)") }
    scope :find_flights, -> (from_airport, to_airport, date){where("from_airport_id = ? AND to_airport_id = ? AND date(departure_time) = ?", from_airport, to_airport, date).order(:departure_time)}
end
