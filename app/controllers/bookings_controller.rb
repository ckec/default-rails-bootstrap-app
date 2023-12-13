class BookingsController < ApplicationController
  include BookingsHelper

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

  private

  def booking_params
    params.require(:booking).permit(:flight_id, passengers_attributes: [:id, :name, :email])
  end
end