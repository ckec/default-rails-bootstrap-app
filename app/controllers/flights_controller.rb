class FlightsController < ApplicationController

  helper_method :find_departure_airport
  helper_method :find_arrival_airport
  
  def index
    @flights = Flight.all
    @airport_options = Airport.all.map { |a| [a.code, a.id] }
    @passenger_count = (1..4).to_a
  end
      
  def search
    start_datetime = make_date_from_params
    @flights = Flight.where(departure_airport_id: flight_params[:departure_airport_id], arrival_airport_id: flight_params[:arrival_airport_id], start_datetime: start_datetime)
    
    @passsenger_count = params[:flight][:passenger_count]

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("flights_table_frame", partial: 'flights_table', locals: { flights: @flights })
      end
      format.html { redirect_to flights_path}
    end
  end

  def find_departure_airport(flight)
    Airport.find(flight.departure_airport_id).code
  end

  def find_arrival_airport(flight)
    Airport.find(flight.arrival_airport_id).code
  end

  private

  def make_date_from_params
    DateTime.new(params[:date][:year].to_i, params[:date][:month].to_i, params[:date][:day].to_i).all_day
  end

  def flight_params
    params.require(:flight).permit(:departure_airport_id, :arrival_airport_id, :date, :passenger_count)
  end
end