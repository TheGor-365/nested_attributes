class DestinationsController < ApplicationController
  before_action :set_destination, only: %i[ show edit update destroy ]

  def index
    @destinations = Destination.all
  end

  def show; end
  def edit; end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new(destination_params)

    respond_to do |format|
      if @destination.save
        format.html { redirect_to destination_url(@destination) }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @destination.update(destination_params)
        format.html { redirect_to destination_url(@destination) }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @destination.destroy

    respond_to do |format|
      format.html { redirect_to destinations_url }
    end
  end

  private

  def set_destination
    @destination = Destination.find(params[:id])
  end

  def destination_params
    params.require(:trip).permit(
      :address,
      :itinerary_id
    )
  end
end
