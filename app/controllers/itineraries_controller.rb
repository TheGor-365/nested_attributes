class ItinerariesController < ApplicationController
  before_action :set_itinerary, only: %i[ show edit update destroy ]

  def index
    @itineraries = Itinerary.all
  end

  def show; end
  def edit; end

  def new
    @itinerary = Itinerary.new
    # @itinerary.destinations.build
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)

    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to itinerary_url(@itinerary) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @itinerary.update(itinerary_params)
        format.html { redirect_to itinerary_url(@itinerary) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @itinerary.destroy

    respond_to do |format|
      format.html { redirect_to itineraries_url }
    end
  end

  private

  def set_itinerary
    @itinerary = Itinerary.find(params[:id])
  end

  def itinerary_params
    params.require(:trip).permit(
      :address,
      :trip_id
    )
  end
end
