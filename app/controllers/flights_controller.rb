class FlightsController < ApplicationController
  def index
    @flights = Flight.all.includes(:departure_airport, :arrival_airport)
    @departures = @flights.map { |flight| flight.departure }.map { |departure| departure.strftime("%Y/%m/%d") }.uniq.sort
  end
end
