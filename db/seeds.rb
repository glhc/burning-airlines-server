# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create an airplane

require 'date'

@users = User.create([
  {
    email: 'first@first.com',
    password: 'password',
    first_name: 'Patrick',
    last_name: 'Horne',
    is_admin: true
  }, {
    email: 'second@second.com',
    password: 'password',
    first_name: 'Tristan',
    last_name: 'w3',
    is_admin: true
  }, {
    email: 'third@third.com',
    password: 'password',
    first_name: 'Chen',
    last_name: 'He',
    is_admin: true
  }
])

@chen = User.find_by first_name: 'Chen'
@chen.reservations.create([
  {
    flight_id: 1,
    seat: '18B'
  }
])

@airplane = Airplane.create([
    { 
      name: 'Boeing 747',
      rows: 20,
      columns: 4
    }, { 
      name: 'Boeing 748',
      rows: 30,
      columns: 6
    }, { 
      name: 'Boeing 749',
      rows: 15,
      columns: 2
    }, { 
      name: 'Boeing 750',
      rows: 20,
      columns: 8
    }, { 
      name: 'Boeing 751',
      rows: 25,
      columns: 6
    }, { 
      name: 'Boeing 752',
      rows: 30,
      columns: 4
    }
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
  }, {
    flight_number: 'GA1337',
    origin: 'New York', 
    destination: 'California', 
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




