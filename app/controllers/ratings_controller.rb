class RatingsController < ApplicationController
#  before_action :set_rating, only: [:show, :edit, :update, :destroy]

=begin
  # GET /ratings
  def index
    @ratings = Rating.all
  end

  # GET /ratings/1
  def show
  end
=end

  # GET /ratings/new
  def new
    @place = get_place
    @rating = current_user.ratings.new
  end

=begin
  # GET /ratings/1/edit
  def edit
  end
=end

  # POST /ratings
  def create
    @place = get_place
    @rating = current_user.ratings.new(rating_params.update(place: @place))
    if @rating.save
      redirect_to @place, notice: "Merci de votre évaluation."
    else
      render :new
    end
  end

=begin
  # PATCH/PUT /ratings/1
  def update
    if @rating.update(rating_params)
      redirect_to @rating, notice: 'Rating was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ratings/1
  def destroy
    @rating.destroy
    redirect_to ratings_url, notice: 'Rating was successfully destroyed.'
  end
=end

  private
=begin
    # Use callbacks to share common setup or constraints between actions.
    def set_rating
      @rating = Rating.find(params[:id])
    end
=end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rating_params
      params.require(:rating).permit(:value1, :value2, :value3, :value4, :value5, :user_id, :place_id)
    end

    def get_place
      Place.find(params[:place_id])
    end
end
