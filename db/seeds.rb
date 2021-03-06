# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create an airplane

require 'date'
require 'faker'

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
    first_name: 'Aaron',
    last_name: 'Cox',
    is_admin: true
  }, {
    email: 'fourth@fourth.com',
    password: 'password',
    first_name: 'Kyle',
    is_admin: true
  }, {
    email: 'fifth@fifth.com',
    password: 'password',
    first_name: 'Yianni',
    last_name: 'He',
    is_admin: true
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
    date: "24/12/2019",
    airplane_id: 2
  }, {
    flight_number: 'GA124',
    origin: 'East Coast', 
    destination: 'West Coast', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA125',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA126',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA127',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA128',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA129',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA130',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA131',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA132',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA133',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA134',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }, {
    flight_number: 'GA135',
    origin: 'New York', 
    destination: 'California', 
    date: "24/12/2019",
    airplane_id: 1
  }
])

def make_reservations_for_user user_first_name
  @user = User.find_by first_name: user_first_name
  @user.reservations.create([
    {
      flight_id: 1,
      seat: "18B"
    }, {
      flight_id: 2,
      seat: "19C"
    }
  ])
end

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

def create_reservations_for_flight flight
  # get number of rows and columns
  rows = flight.airplane.rows
  columns = flight.airplane.columns
  users = User.all
  
  # Make an array of seat letters
  seat_letter_array = []
  columns.times do |i|
    seat_letter_array.push (65 + i).chr
  end

  users.each do |user|
    new_seat = nil
    seat_selected = false
    while !seat_selected do
      # random row
      possible_seat_row = (Random.rand * rows).ceil 
      # random seat index
      possible_seat_column = (Random.rand * column).floor
      # convert to letter
      possible_seat_letter = seat_letter_array[possible_seat_column]
      possible_seat = possible_seat_row.to_s + possible_seat_letter

      if Reservations.find_by seat: possible_seat
        new_seat = possible_seat
        seat_selected = true
      end
    end

    user.reservations.create({
      flight_id: flight.id, 
      seat: new_seat,
    })
  end
end


