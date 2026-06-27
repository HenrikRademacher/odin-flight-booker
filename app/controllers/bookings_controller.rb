class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @booking = @flight.bookings.new
    params[:amount].to_i.times { @booking.passengers.build }
  end
end
