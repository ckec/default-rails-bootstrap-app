class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params[:flight].to_i)
  end
  
  def create

  end
end
