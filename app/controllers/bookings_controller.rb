class BookingsController < ApplicationController
  include BookingsHelper

  helper_method :find_departure_airport
  helper_method :find_arrival_airport

  def new
    @booking = Booking.new
    params[:passenger_count].to_i.times { @booking.passengers.build }
    @flight = Flight.find(params[:flight].to_i)
  end
  
  def create
    @booking = Booking.new(booking_params)
    @booking.flight_id = params[:booking][:flight_id].to_i
    if @booking.save
      redirect_to booking_path(@booking)
    else
      @flight = Flight.find(params[:booking][:flight_id])
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def find_departure_airport(flight)
    Airport.find(flight.departure_airport_id).code
  end

  def find_arrival_airport(flight)
    Airport.find(flight.arrival_airport_id).code
  end

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end