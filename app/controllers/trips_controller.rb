class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  def index
    @trips = Trip.all
    @parents = Place.all.order("id ASC").limit(1)
  end

  # GET /trips/1
  def show
  end

  # GET /trips/new
  def new
    @trip = Trip.new
    @areas = Place.where(id: 1)
    @countries = Place.find(1).children
    # @countries = Place.find(2).siblings
    # @countries = Place.where("length(ancestry) <= 1")
    @cities = Place.find(6).siblings
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  def create
    @trip = Trip.new(trip_params)
    # @trip.user_id = current_user.id
    if @trip.save
      redirect_to @trip, notice: 'Trip was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trips/1
  def update
    if @trip.update(trip_params)
      redirect_to @trip, notice: 'Trip was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trips/1
  def destroy
    @trip.destroy
    redirect_to trips_url, notice: 'Trip was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def trip_params
      params.require(:trip).permit(:title, :country, :area, :city, :start_on, :finish_on, :flexible, :description, :goal, :user_id)
    end
end