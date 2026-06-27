class BookingsController < ApplicationController
  def new
    @flight = Flight.find(params[:flight])
    @booking = @flight.bookings.new
    params[:amount].to_i.times { @booking.passengers.build }
  end
  def create
    @flight = Flight.find(params[:booking][:flight])
    @booking = @flight.bookings.new(booking_params)
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @booking = Booking.find(params[:id])
  end

  private
  def booking_params
    params.expect(booking: [ passengers_attributes: [ [ :id, :name, :email ] ] ])
  end
end
