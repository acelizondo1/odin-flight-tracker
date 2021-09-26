# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

FLIGHT_DURATIONS = {
    1 => {
        2 => 5400,
        3 => 2880,
        4 => 16620,
        5 => 15660,
        6 => 4380,
        7 => 9240,
        8 => 9160,
        9 => 9900
    },
    2 => {
        3 => 3960,
        4 => 12900,
        5 => 12000,
        6 => 7860,
        7 => 11280,
        8 => 7320,
        9 => 6060
    },
    3 => {
        4 => 15180,
        5 => 14100,
        6 => 5760,
        7 => 9420,
        8 => 3420,
        9 => 7980
    },
    4 => {
        5 => 3420,
        6 => 20580,
        7 => 20340,
        8 => 12120,
        9 => 7860
    }, 
    5 => {
        6 => 17220,
        7 => 15960,
        8 => 9180,
        9 => 6480
    }, 
    6 => {
        7 => 9060,
        8 => 11760,
        9 => 13500
    },
    7 => {
        8 => 8160,
        9 => 12180
    },
    8 => {
        9 => 5760
    },
    9 => {}
}

def find_flight_time(from, to)
    FLIGHT_DURATIONS[from][to] || FLIGHT_DURATIONS[to][from]
end

# def rand_time(from, to=Time.now)
#     Time.at(rand_in_range(from.to_f, to.to_f))
# end

# def rand_in_range(from, to)
#     rand * (to - from) + from
# end

airports = Airport.create([
    {city: 'Detroit', state: 'MI', airport_code: 'DTW'},
    {city: 'Minneapolis', state: 'MN', airport_code: 'MSP'},
    {city: 'Chicago', state: 'IL', airport_code: 'ORD'},
    {city: 'San Francisco', state: 'CA', airport_code: 'SFO'},
    {city: 'Los Angeles', state: 'CA', airport_code: 'LAX'},
    {city: 'New York', state: 'NY', airport_code: 'JFK'},
    {city: 'Miami', state: 'FL', airport_code: 'MIA'},
    {city: 'Dallas', state: 'TX', airport_code: 'DFW'},
    {city: 'Denver', state: 'CO', airport_code: 'DEN'}
])

# flights = []
# (1..60).each do |int|
#     to_airport = rand(1..9)
#     from_airport = rand(1..9)
#     while to_airport == from_airport
#         from_airport = rand(1..9)
#     end
#     Flight.create([:departure_time => rand_time(int.days.from_now), :duration=> "2hrs", :to_airport_id => to_airport, :from_airport_id => from_airport])
# end

(1..9).each do |from|
    (1..9).each do |to|
        if from == to
            break
        end
        
        DateTime.new(2022, 1, 1).upto(DateTime.new(2022, 1, 15)).each do |date|
            3.times do 
                hour = rand(6..20)
                minute = rand(0..59)
                date = date.change(hour: hour, minute: minute)
                Flight.create([:departure_time => date, :duration=> find_flight_time(from, to), :to_airport_id => to, :from_airport_id => from])
            end
        end
    end
end

