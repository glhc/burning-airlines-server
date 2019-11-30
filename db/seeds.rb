# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create an airplane

require 'date'

@airplane = Airplane.create([
    { name: 'Boeing 747' },
    { name: 'Boeing 1234' }
])

flights = Flight.create([
  {
    flight_number: 'GA123',
    origin: 'Kansas', 
    destination: 'Oz', 
    date: DateTime.now,
    airplane_id: 2
  }, {
    flight_number: 'GA1337',
    origin: 'East Coast', 
    destination: 'West Coast', 
    date: DateTime.now,
    airplane_id: 1
  }
])


def create_airplane
  @airplane = Airplane.create(
    name: 'Boeing 747'
  )

  def create_seats
    rows = 20
    columns = 4
    capacity = rows * columns

    capacity.times do |i|
      seats.create()
    end
  end
end




