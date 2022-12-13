class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]

  def index
    @trips = Trip.all
  end

  def show; end

  def edit
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
    @trip.itineraries.build
    @itinerary = Itinerary.new
    @trip.itineraries.each do |itinerary|
      itinerary.destinations.build
    end
  end

  def create
    @trip = Trip.new(trip_params)

    respond_to do |format|
      if @trip.save
        format.html { redirect_to trip_url(@trip) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to trip_url(@trip) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @trip.destroy

    respond_to do |format|
      format.html { redirect_to trips_url }
    end
  end

  private

  def set_trip
    @trip = Trip.find(params[:id])
  end

  def trip_params
    params.require(:trip).permit(
      :country,
      itineraries_attributes: [
        :id,
        :trip_id,
        :village,
        destinations_attributes: [
          :id,
          :itinerary_id,
          :address,
          :_destroy
        ]
      ]
    )
  end
end
