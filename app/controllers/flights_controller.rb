class FlightsController < ApplicationController
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    @flights = Flight.all
    # empty array to pass capacity of all flights
    @capacity_array = {}
    # empty array to pass airplane_model
    @airplane_model_array = {} 

    @flights.each do |flight|
      rows = flight.airplane.rows
      columns = flight.airplane.columns
      capacity = rows * columns

      airplane_model = flight.airplane.name
      # use .merge!("key" => "value") syntax to append id => capacity or id => model
      @capacity_array.merge! capacity
      @airplane_model_array.push airplane_model

    end
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end

  # GET /flights/1/info.json
  def info
    @flight = Flight.find(params[:id].to_i)

    # initialise empty array
    @isTaken = []
    @flight.airplane.rows.times do |i|
      row = []
      @flight.airplane.columns.times do |j|
        row.push(nil)
      end
      @isTaken.push(row)
    end

  # populate seats array with user's names based off reservations
  reservations = @flight.reservations.all
  reservations.all.each do |reservation|
    seat_row_index = reservation.seat.chop.to_i - 1
    seat_letter = get_seat_letter(reservation.seat)
    seat_column_index = char_map(seat_letter).to_i
    @isTaken[seat_row_index][seat_column_index] = reservation.user.first_name.to_s 
  end

  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights
  # POST /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to @flight, notice: 'Flight was successfully created.' }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1
  # PATCH/PUT /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to @flight, notice: 'Flight was successfully updated.' }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1
  # DELETE /flights/1.json
  def destroy
    @flight.destroy
    respond_to do |format|
      format.html { redirect_to flights_url, notice: 'Flight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      @flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params.require(:flight).permit(:flight_number, :origin, :destination, :date, :airplane_id)
    end

    def char_map char
      charmap = {
        "a": 0,
        "A": 0,
        "b": 1,
        "B": 1,
        "c": 2,
        "C": 2,
        "d": 3,
        "D": 3,
        "e": 4,
        "E": 4,
        "f": 5,
        "F": 5,
        "g": 6,
        "G": 6,
        "h": 7,
        "H": 7,
        "i": 8,
        "I": 8,
        "j": 9,
        "J": 9,
        "k": 10,
        "K": 10,
        "l": 11,
        "L": 11,
        "m": 12,
        "M": 12,
        "n": 13,
        "N": 13,
        "o": 14,
        "O": 14,
        "p": 15,
        "P": 15,
        "q": 16,
        "Q": 16,
        "r": 17,
        "R": 17,
        "s": 18,
        "S": 18,
        "t": 19,
        "T": 19,
        "u": 20,
        "U": 20,
        "v": 21,
        "V": 21,
        "w": 22,
        "W": 22,
        "x": 23,
        "X": 23,
        "y": 24,
        "Y": 24,
        "z": 25,
        "Z": 25
      }

      charmap[char]
    end

    def get_seat_letter(seat_string)
      seat_string.last
    end
end
