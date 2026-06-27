class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @departure = @flight.departure_airport
    @arrival = @flight.arrival_airport
  end
end
