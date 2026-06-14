class FlightsController < ApplicationController
  def index
    @airports = Airport.all.order(name: :asc)
    if params[:arr] && params[:dep] && params[:day] && params[:amount]
      @dep = Airport.find_by code: params[:dep]
      @arr = Airport.find_by code: params[:arr]
      @day = Date.parse params[:day]
      @stop = @day + 1.days
      @local_flights = Flight.includes(:departure_airport, :arrival_airport).where(departure_airport: @dep).where(arrival_airport: @arr)
      @flights = @local_flights.where("departure >= :start AND departure <= :stop", { start: @day, stop: @stop }).order(departure: :asc)
      puts "Filtering flights"
    else
      @flights = Flight.all.includes(:departure_airport, :arrival_airport)
      puts "Got all flights"
    end
    @departures = Flight.all.map { |flight| flight.departure }.map { |departure| departure.strftime("%Y/%m/%d") }.uniq.sort
    puts params
  end
end
