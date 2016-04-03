class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index]

  # GET /places
  def index
    @places = Place.sort
    if search && !search(params[:search][:term])
      @yelp_places = Yelp.client.search(params[:search][:term]).businesses
      # TODO : Revoir ça.
    end
  end

  # GET /places/4
  def show
  end

  # GET /places/new
  def new
    @place = Place.new
  end

=begin
  # GET /places/1/edit
  def edit
  end
=end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place, notice: 'Place was successfully created.'
    else
      render :new
    end
  end

=begin
  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      redirect_to @place, notice: 'Place was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
    redirect_to places_url, notice: 'Place was successfully destroyed.'
  end
=end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name, :address, :latitude, :longitude)
    end
end
