module PlacesHelper
  def color_by_rating(rating)
    if rating.nil?
      return 'grey'
    elsif rating.round == 0
      return 'red'
    elsif rating.round == 1
      return 'orange'
    else
      return 'green'
    end
  end

  def map_address(place)
    start = place.name.index("-")
    start ||= -1 # Offsetting the +1
    "#{place.name[(start+1)..-1].strip} #{place.address}"
  end
end
