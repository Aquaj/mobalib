module PlacesHelper
  def map_address(place)
    "#{place.address}"
  end

  def full_address(place)
    start = place.name.index("-")
    start ||= -1 # Offsetting the +1
    "#{place.name[(start+1)..-1].strip} #{place.address}"
  end
end
