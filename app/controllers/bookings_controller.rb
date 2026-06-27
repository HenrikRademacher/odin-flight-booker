class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @booking = @flight.bookings.new
  end
end
