# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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
def rand_time(from, to=Time.now)
    Time.at(rand_in_range(from.to_f, to.to_f))
end

def rand_in_range(from, to)
    rand * (to - from) + from
end
flights = []
(1..30).each do |int|
    to_airport = rand(1..9)
    from_airport = rand(1..9)
    while to_airport == from_airport
        from_airport = rand(1..9)
    end
    Flight.create([:departure_time => rand_time(int.days.from_now), :duration=> "2hrs", :to_airport_id => to_airport, :from_airport_id => from_airport])
end

