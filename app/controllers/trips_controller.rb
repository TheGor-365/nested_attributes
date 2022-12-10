class TripsController < ApplicationController
  before_action :set_trip, only: %i[ show edit update destroy ]

  def index
    @trips = Trip.all
  end

  def show; end
  def edit; end

  def new
    @trip = Trip.new
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
    params.fetch(:trip, {})
  end
end
