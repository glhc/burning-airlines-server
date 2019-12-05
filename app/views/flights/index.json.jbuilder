# json.array! @flights, partial: "flights/flight", as: :flight
json.array! @flights.each do |flight|
  json.flight_number flight.flight_number
  json.origin flight.origin
  json.destination flight.destination
  json.date flight.date
  json.airplane_id flight.airplane_id
  json.capacity @capacity_array[flight.id]
  json.airplane_model @airplane_model_array[flight.id]
end

